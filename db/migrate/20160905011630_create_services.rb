class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
            # t.integer  :cant
            # t.string  :color

            t.integer :order_id

            #tipo de trabajo
            t.boolean  :corona, :default => false
            t.boolean  :puente, :default => false
            t.boolean  :implante, :default => false
            t.boolean  :barra, :default => false
            t.boolean  :hibrida, :default => false
            t.boolean  :carilla, :default => false
            t.boolean  :in_onlay, :default => false
            t.boolean  :inlay_bridge, :default => false
            t.boolean  :lente_contacto, :default => false
            t.boolean  :perno, :default => false
            t.boolean  :sold_laser, :default => false

            #colorimetro
            t.boolean  :vita_classic, :default => false
            t.boolean  :vita_3d, :default => false
            t.boolean  :bioform, :default => false
            t.boolean  :chromarcop, :default => false
            t.boolean  :col_otras, :default => false

            #material
            t.boolean  :zirconio, :default => false
            t.boolean  :disilicato, :default => false
            t.boolean  :fedespatica, :default => false
            t.boolean  :porcelana, :default => false
            t.boolean  :pmma, :default => false
            t.boolean  :polimero, :default => false
            t.boolean  :composite, :default => false
            t.boolean  :metal_porcelana, :default => false
            t.boolean  :zirconio_porcelana, :default => false
            t.boolean  :peek, :default => false

            #color del munon
            t.boolean  :natural, :default => false
            t.boolean  :pimentado, :default => false
            t.boolean  :metal, :default => false

            #procedimiento
            t.boolean  :fresado_maquinado, :default => false
            t.boolean  :prensado, :default => false
            t.boolean  :colado, :default => false

            #metales
            t.boolean  :cromo_cobalto, :default => false
            t.boolean  :titanium, :default => false
            t.boolean  :cromo_niquel, :default => false
            t.boolean  :oro, :default => false
            t.boolean  :paladio, :default => false

            t.timestamps null: false
          end
  end
end






