Spree::OptionValue.class_eval do

  has_attached_file :image,
    :styles => {:small => "40x40#", :large => "100x100#"},
    :path          => '/option_values/:id/:style/:basename.:extension',
    :url           => ':path'
    
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def has_image?
    image_file_name && !image_file_name.empty?
  end

  default_scope { order("#{quoted_table_name}.position") }
  scope :for_product, lambda { |product| select("DISTINCT #{table_name}.*").where("spree_option_values_variants.variant_id IN (?)", product.variant_ids).joins(:variants) }
end
