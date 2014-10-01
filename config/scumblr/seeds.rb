
if(ENV["SEED_ADMIN"] == "true" && User.count == 0)
  User.create(:email=>"admin@admin.admin", :password=>"password", :password_confirmation=>"password", :admin=>true)
end

if(ENV["SEED_STATUSES"] == "true" && Status.count == 0)
  Status.create(:name=>"New", :closed=>false, :is_invalid=>false)
  Status.create(:name=>"Investigating", :closed=>false, :is_invalid=>false)
  Status.create(:name=>"False Positive", :closed=>true, :is_invalid=>true)
  Status.create(:name=>"Closed", :closed=>true, :is_invalid=>false)
end

