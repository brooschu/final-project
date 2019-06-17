class TypesController < ApplicationController
  def list
    @types = Type.all

    render("type_templates/list.html.erb")
  end

  def details
    @type = Type.where({ :id => params.fetch("id_to_display") }).first

    render("type_templates/details.html.erb")
  end

  def blank_form
    @type = Type.new

    render("type_templates/blank_form.html.erb")
  end

  def save_new_info
    @type = Type.new

    @type.name = params.fetch("name")

    if @type.valid?
      @type.save

      redirect_to("/types", { :notice => "Type created successfully." })
    else
      render("type_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @type = Type.where({ :id => params.fetch("id_to_prefill") }).first

    render("type_templates/prefilled_form.html.erb")
  end

  def save_edits
    @type = Type.where({ :id => params.fetch("id_to_modify") }).first

    @type.name = params.fetch("name")

    if @type.valid?
      @type.save

      redirect_to("/types/" + @type.id.to_s, { :notice => "Type updated successfully." })
    else
      render("type_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @type = Type.where({ :id => params.fetch("id_to_remove") }).first

    @type.destroy

    redirect_to("/types", { :notice => "Type deleted successfully." })
  end
end
