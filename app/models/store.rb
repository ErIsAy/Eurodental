class Store < ActiveRecord::Base
  belongs_to :sale
  belongs_to :worktype
  belongs_to :material
  belongs_to :mcolor
  belongs_to :gcolor
  belongs_to :procedure


  validates :worktype_id, :presence => true
  validates :tooth, :presence => true


  attr_accessor :worktype_name
  attr_accessor :material_name
  attr_accessor :mcolor_name
  attr_accessor :gcolor_name
  attr_accessor :procedure_name

  def worktype_name
    worktype.name if worktype
  end

  def material_name
    material.name if material
  end

  def mcolor_name
    mcolor.name if mcolor
  end

  def gcolor_name
    gcolor.name if gcolor
  end

  def procedure_name
    procedure.name if procedure
  end




end
