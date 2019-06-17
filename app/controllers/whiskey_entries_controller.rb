class WhiskeyEntriesController < ApplicationController
  def list
    @whiskey_entries = WhiskeyEntry.all
    
    render("whiskey_entry_templates/list.html.erb")
  end
  
  def details
    @whiskey_entry = WhiskeyEntry.where({ :id => params.fetch("id_to_display") }).first

    render("whiskey_entry_templates/details.html.erb")
  end

  def blank_form
    @whiskey_entry = WhiskeyEntry.new

    render("whiskey_entry_templates/blank_form.html.erb")
  end

  def save_new_info
    @whiskey_entry = WhiskeyEntry.new

    @whiskey_entry.image = params.fetch("image")
    @whiskey_entry.user_id = params.fetch("user_id")
    @whiskey_entry.whiskey_name = params.fetch("whiskey_name")
    @whiskey_entry.type_id = params.fetch("type_name")
    @whiskey_entry.rating = params.fetch("rating")
    @whiskey_entry.note_text = params.fetch("note_text")
    @whiskey_entry.price = params.fetch("price")
  

    if @whiskey_entry.valid?
      @whiskey_entry.save
      


      redirect_to("/whiskey_entries", { :notice => "Whiskey entry created successfully." })
    else
      render("whiskey_entry_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @whiskey_entry = WhiskeyEntry.where({ :id => params.fetch("id_to_prefill") }).first

    render("whiskey_entry_templates/prefilled_form.html.erb")
  end

  def save_edits
    @whiskey_entry = WhiskeyEntry.where({ :id => params.fetch("id_to_modify") }).first

    @whiskey_entry.image = params.fetch("image")
    @whiskey_entry.user_id = params.fetch("user_id")
    @whiskey_entry.whiskey_name = params.fetch("whiskey_name")
    @whiskey_entry.type_id = params.fetch("type_id")
    @whiskey_entry.rating = params.fetch("rating")
    @whiskey_entry.note_text = params.fetch("note_text")
    @whiskey_entry.price = params.fetch("price")

    if @whiskey_entry.valid?
      @whiskey_entry.save

      redirect_to("/whiskey_entries/" + @whiskey_entry.id.to_s, { :notice => "Whiskey entry updated successfully." })
    else
      render("whiskey_entry_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @whiskey_entry = WhiskeyEntry.where({ :id => params.fetch("id_to_remove") }).first

    @whiskey_entry.destroy

    redirect_to("/whiskey_entries", { :notice => "Whiskey entry deleted successfully." })
  end
end
