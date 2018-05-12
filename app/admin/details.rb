ActiveAdmin.register_page "Details" do
  
  content do
    day_counts = Shift.group_by_day(:start).count
    raw(line_chart day_counts, label: "Shifts", curve: false,
          library: {vAxis: {ticks: day_counts.values}, title: "Shifts"})
  end
  
end