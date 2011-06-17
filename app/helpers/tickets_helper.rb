module TicketsHelper
  def options_for_status search
    opt = {}
    opt = {'Open' => 'Open', 'Assigned' => 'Assigned', 'In-Progress' => 'In-Progress', 'Resolved' => 'Resolved', 'Reopened' => 'Reopened'}
    
    opt.store('-- Status --', '') if search
      
    options_for_select(opt)
  end

  def options_for_priority search
    pt = {}
    opt = {'Minor' => 'Minor', 'Normal' => 'Normal', 'Major' => 'Major', 'Critical' => 'Critical'}
    
    opt.store('-- Priority --', '') if search
  
    options_for_select(opt)
  end

  def options_for_tracker search
    options_for_select('Bug' => 'Bug', 'Task' => 'Task')
  end
end
