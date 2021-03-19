class AgendasController < ApplicationController
  # before_action :set_agenda, only: %i[show edit update destroy]
  before_action :set_agenda, only: %i[destroy]

  def index
    @agendas = Agenda.all
  end

  def new
    @team = Team.friendly.find(params[:team_id])
    @agenda = Agenda.new
  end

  def create
    @agenda = current_user.agendas.build(title: params[:title])
    @agenda.team = Team.friendly.find(params[:team_id])
    current_user.keep_team_id = @agenda.team.id
    if current_user.save && @agenda.save
      redirect_to dashboard_url, notice: I18n.t('views.messages.create_agenda')
    else
      render :new
    end
  end

  def destroy
    @destroy_agenda = @agenda
    @agenda_user_email = User.where(keep_team_id:@agenda.team_id).pluck(:email)
    binding.pry
    if @agenda.destroy
      DeleteMailer.delete_mail(@destroy_agenda).deliver
      redirect_to dashboard_path, notice:"アジェンダを削除しました"
    else
      render :new
    end
  end

  private

  def set_agenda
    @agenda = Agenda.find(params[:id])
  end

  def agenda_params
    params.fetch(:agenda, {}).permit %i[title description]
  end
end
