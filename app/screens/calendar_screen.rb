class CalendarScreen < ProMotion::Screen
  title "Select a Date:"

  def will_appear
  	@view_setup ||= begin
			set_nav_bar_right_button "Cancel", action: :close_modal, type: UIBarButtonItemStyleDone
	    self.navigationController.navigationBar.barStyle = UIBarStyleBlack
    	view.scrollToDate(view.selectedDate, animated:false)
  	end
  end

  def close_modal
    self.navigationController.dismissModalViewControllerAnimated(true)
  end

end
