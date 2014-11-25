class SubjectsController < ApplicationController
	before_action :find_subject, only: [:show, :edit, :update, :destroy]
	
	def index
		@subjects = Subject.where(admin_id: current_admin)
	end

	def show
	end

	def new
		@subject = current_admin.subjects.build
	end

	def create
		@subject = current_admin.subjects.build(subject_params)

		if @subject.save
			redirect_to @subject
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @subject.update(subject_params)
			redirect_to @subject
		else
			render 'edit'
		end
	end

	def destroy
		@subject.destroy
		respond_to do |format|
			format.html{redirect_to subjects_url, notice: "Subject was successfully deleted"}
		end
	end

	private

	def find_subject
		@subject = Subject.find(params[:id])
	end

	def subject_params
		params.require(:subject).permit(:name, :lecturer, :subject_code)
	end
end
