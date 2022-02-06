ActiveAdmin.register Show do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :venue, :venue_address, :start_time
  #
  # or
  #
  # permit_params do
  #   permitted = [:venue, :venue_address, :start_time]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :venue, :venue_address, :start_time, music_ids: []

  show do
    attributes_table do
      row :venue
      row :venue_address
      row :start_time
    end
    panel "Musics" do
      table_for show.musics do
        column :artist
        column :title
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :venue
      f.input :venue_address
      f.input :start_time, as: :date_time_picker
    end

    f.inputs "Musics" do
      f.input :musics, as: :searchable_select, collection: Music.collection(Music.all)
    end
    f.actions
  end

  
end
