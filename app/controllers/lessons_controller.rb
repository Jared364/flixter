class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_user_enrolled?


  def show
  end

  private

  def is_user_enrolled?
    unless current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_url(current_lesson.section.course), alert: 'Please Enroll to Continue'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
