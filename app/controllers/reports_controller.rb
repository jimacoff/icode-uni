class ReportsController < ApplicationController

  layout "enter_data", :only => [:pdf_estimation_report] 


  def index
  end

  def list_estimation_report
    @estimation_item = Estimation.all
  end

  def pdf_estimation_report
    
    if params[:commit] == "PDF Report"
      if params[:estimation_ids].present?
        # render :text => params[:estimation_ids].to_json
        @estimation = Estimation.find(params[:estimation_ids])
        #render :text => @estimation.to_json
        # html = render_to_string(:layout => false , :action => "pdf_estimation_report.html.erb")
        #   @kit = PDFKit.new(html)
        #   @kit.stylesheets << "#{Rails.root.to_s}/app/assets/stylesheets/bootstrap.css"
        #   send_data(@kit.to_pdf, :filename => "pdf_estimation_report.pdf",
        #                           :type => 'application/pdf',
        #                           :disposition => "attachement")
render :text => @estimation.to_json
      end
    elsif params[:commit] == "Show"
      if params[:estimation_ids].present?

         @estimation = Estimation.find(params[:estimation_ids])
          # render :text => @estimation.to_json
        respond_to do |format|
        format.html
        end
      end 
    else
      redirect_to estimation_report_reports_path
    end
  end  


  def testing_page
      html = render_to_string(:layout => false , :action => "testing_page.html.erb")
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf ,:filename => "testing_page.pdf",
                                :type => 'application/pdf' , 
                                :disposition => "attachement" )
  end



end
