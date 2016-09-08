class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|

            #referencia a la orden
            t.integer :order_id

            #otras opciones
            t.boolean :antagonista, :default => false
            t.boolean :foto, :default => false
            t.boolean :mordida, :default => false
            t.integer :quantity, :in => 0..99
            t.integer :tooth_number

            #tipo de trabajo
            t.boolean  :corona, :default => false
            t.boolean  :puente, :default => false
            t.string :puente_a
            t.string :puente_b
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
            t.boolean  :vita_td, :default => false
            t.boolean  :bioform, :default => false
            t.boolean  :chromarcop, :default => false
            t.boolean  :col_otras, :default => false

            t.string :vita_classic_text
            t.string :vita_3d_text
            t.string :bioform_text
            t.string :chromarcop_text
            t.string :col_otras_text

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

            #subtotal precio
            t.integer :service_total


            t.timestamps null: false
          end
  end
end






