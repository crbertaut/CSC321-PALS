ActiveAdmin.register_page "Donations" do
  

  
  
  
  content do
    day_counts = Donation.group_by_day(:created_at).sum(:amount)
    
    raw(line_chart day_counts, label: "Donations", curve: false, library: {vAxis: {ticks: day_counts.values}})
  end
  
end