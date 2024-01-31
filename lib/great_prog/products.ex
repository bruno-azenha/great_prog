defmodule GreatProg.Products do
  alias GreatProg.Entities.Product

  def get_all() do
    [
      %Product{
        name: "Insightful Call",
        description:
          "Unleash transformation, gain clarity, conquer challenges. Elevate your life with insights tailored for your growth and success.",
        link: "https://calendly.com/coach-bruno/have-an-insight",
        product_image_filename: "photoshoot_stairs.jpg"
      }
    ]
  end
end
