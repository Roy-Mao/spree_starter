Spree::FrontendHelper.module_eval do
  def plp_and_carousel_image(product, image_class = '')
    image = default_image_for_product_or_variant(product)

    image_url = if image.present?
                  main_app.url_for(image.url('plp'))
                else
                  # change default display image
                  asset_path('noimage/default_no_shirt.svg')
                end

    image_style = image&.style(:plp)

    lazy_image(
      src: image_url,
      srcset: carousel_image_source_set(image),
      alt: product.name,
      width: image_style&.dig(:width) || 278,
      height: image_style&.dig(:height) || 371,
      class: "product-component-image d-block mw-100 #{image_class}"
    )
  end
end
