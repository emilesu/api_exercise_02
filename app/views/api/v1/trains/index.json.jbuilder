json.meta do
  json.current_page @trains.current_page
  json.total_pages @trains.total_pages
  json.per_page @trains.per_page
  json.total_entries @trains.total_entries

  if @trains.current_page == @trains.total_pages
    json.next_url nil
  else
    json.next_url api_v1_trains_url( :page => @trains.next_page )
  end

  if @trains.current_page == 1
    json.previous_url nil
  else
    json.previous_url api_v1_trains_url( :page => @trains.previous_page )
  end
end

json.data do
  json.array! @trains do |train|
    json.number train.number

    if train.train_logo.present?
      json.logo_url asset_url( train.train_logo.url )
      json.logo_file_size train.train_logo.size
      json.logo_content_type train.train_logo.content_type
    else
      json.logo_url nil
      json.logo_file_size nil
      json.logo_content_type nil
    end

    json.available_seats train.available_seats
    json.train_url api_v1_train_url(train.number)
    json.created_at train.created_at
  end
end
