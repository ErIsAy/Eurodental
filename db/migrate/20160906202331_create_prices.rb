class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      #tipo de trabajo precios
      t.integer :perno_price,	default: 0
      t.integer :soldadura_price,	default: 0

      #materiales precios
      t.integer :zirconio_price,	default: 0
      t.integer :disilicato_price,	default: 0
      t.integer :fedespatica_price,	default: 0
      t.integer :porcelana_price,	default: 0
      t.integer :pmma_price,	default: 0
      t.integer :polimero_price,	default: 0
      t.integer :composite_price,	default: 0
      t.integer :metal_porcelana_price,	default: 0
      t.integer :zirconio_porcelana_price,	default: 0
      t.integer :peek_price,	default: 0

      #color precios
      t.integer :vita_classic_price,	default: 0
      t.integer :vita_3d_price,	default: 0
      t.integer :bioform_price,	default: 0
      t.integer :chromarcop_price,	default: 0
      t.integer :otras_price,	default: 0

      t.timestamps null: false
    end
  end
end
