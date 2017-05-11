module ApplicationHelper
  ALERT_TYPES = {
    success: 'alert-success',
    error: 'alert-danger',
    alert: 'alert-warning',
    notice: 'alert-info'
  }.freeze

  def bootstrap_class_for(flash_type)
    ALERT_TYPES[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
        concat content_tag(:button, 'x', class: 'close', data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

  def octobox_icon(height=16)
    "<svg class='octobox-icon' height=#{height} viewBox='0 0 14 16' version='1.1'>
      <path d='M13.58,4.71 L12.908,4.229 C12.766,3.566 12.461,2.994 12.025,2.522 C12.122,2.281 12.438,1.322 11.928,0.022 C11.928,0.022 11.14,-0.227 9.348,1.004 C8.949,0.892 8.536,0.833 8.118,0.8 L7,0 L5.882,0.8 C5.463,0.833 5.05,0.892 4.652,1.004 C2.86,-0.234 2.072,0.022 2.072,0.022 C1.562,1.322 1.877,2.281 1.975,2.522 C1.539,2.994 1.234,3.566 1.092,4.229 L0.42,4.71 C0.16,4.89 8.8817842e-16,5.19 8.8817842e-16,5.52 L8.8817842e-16,14 C8.8817842e-16,14.55 0.45,15 1,15 L13,15 C13.55,15 14,14.55 14,14 L14,5.52 C14,5.19 13.85,4.9 13.58,4.71 Z M13,13.5 L8.5,10.5 L13,7.5 L13,13.5 Z M2,14 L7,11 L12,14 L2,14 Z M1,7.5 L5.5,10.5 L1,13.5 L1,7.5 Z M7,10 L2.58,7.227 C2.541,7.011 2.515,6.787 2.515,6.548 C2.515,5.974 2.8,5.43 3.28,4.984 C4.083,4.245 5.455,4.637 7,4.637 C8.553,4.637 9.91,4.245 10.72,4.984 C11.207,5.43 11.485,5.966 11.485,6.548 C11.485,6.78 11.459,6.998 11.421,7.209 L7,10 Z M8.8828,5.2944 C8.3878,5.2944 7.9828,5.8904 7.9828,6.6384 C7.9828,7.3864 8.3878,7.9904 8.8828,7.9904 C9.3778,7.9904 9.7818,7.3864 9.7818,6.6384 C9.7818,5.8904 9.3848,5.2944 8.8828,5.2944 Z M5.1177,5.2944 C4.6227,5.2944 4.2177,5.8984 4.2177,6.6384 C4.2177,7.3784 4.6227,7.9904 5.1177,7.9904 C5.6127,7.9904 6.0177,7.3864 6.0177,6.6384 C6.0177,5.8904 5.6127,5.2944 5.1177,5.2944 Z'></path>
    </svg>".html_safe
  end

  def octobox_reverse_icon(height=16)
    "<svg class='octobox-icon' height=#{height} viewBox='0 0 22 22' version='1.1'>
      <path d='M11,22 C4.92486775,22 0,17.0751322 0,11 C0,4.92486775 4.92486775,0 11,0 C17.0751322,0 22,4.92486775 22,11 C22,17.0751322 17.0751322,22 11,22 Z M17.58,7.71 L16.908,7.229 C16.766,6.566 16.461,5.994 16.025,5.522 C16.122,5.281 16.438,4.322 15.928,3.022 C15.928,3.022 15.14,2.773 13.348,4.004 C12.949,3.892 12.536,3.833 12.118,3.8 L11,3 L9.882,3.8 C9.463,3.833 9.05,3.892 8.652,4.004 C6.86,2.766 6.072,3.022 6.072,3.022 C5.562,4.322 5.877,5.281 5.975,5.522 C5.539,5.994 5.234,6.566 5.092,7.229 L4.42,7.71 C4.16,7.89 4,8.19 4,8.52 L4,17 C4,17.55 4.45,18 5,18 L17,18 C17.55,18 18,17.55 18,17 L18,8.52 C18,8.19 17.85,7.9 17.58,7.71 Z M17,16.5 L12.5,13.5 L17,10.5 L17,16.5 Z M6,17 L11,14 L16,17 L6,17 Z M5,10.5 L9.5,13.5 L5,16.5 L5,10.5 Z M11,13 L6.58,10.227 C6.541,10.011 6.515,9.787 6.515,9.548 C6.515,8.974 6.8,8.43 7.28,7.984 C8.083,7.245 9.455,7.637 11,7.637 C12.553,7.637 13.91,7.245 14.72,7.984 C15.207,8.43 15.485,8.966 15.485,9.548 C15.485,9.78 15.459,9.998 15.421,10.209 L11,13 Z M12.8828,8.2944 C12.3878,8.2944 11.9828,8.8904 11.9828,9.6384 C11.9828,10.3864 12.3878,10.9904 12.8828,10.9904 C13.3778,10.9904 13.7818,10.3864 13.7818,9.6384 C13.7818,8.8904 13.3848,8.2944 12.8828,8.2944 Z M9.1177,8.2944 C8.6227,8.2944 8.2177,8.8984 8.2177,9.6384 C8.2177,10.3784 8.6227,10.9904 9.1177,10.9904 C9.6127,10.9904 10.0177,10.3864 10.0177,9.6384 C10.0177,8.8904 9.6127,8.2944 9.1177,8.2944 Z'></path>
    </svg>".html_safe
  end

  def menu_separator(custom_class=nil)
    "<li class='divider #{custom_class}'></li>".html_safe
  end
end
