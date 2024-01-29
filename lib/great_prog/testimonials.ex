defmodule GreatProg.Testimonials do
  alias GreatProg.Entities.Testimonial

  def get_all() do
    [
      %Testimonial{
        name: "Natalia Tykhonravova",
        text:
          "I highly recommend these coaching sessions with Bruno to anyone looking to improve and succeed in their professional life. The support, guidance, and personalized attention provided by him have been invaluable, and I am confident that anyone who participates in these sessions will see similar benefits.",
        avatar_filename: "natalia_tykhonravova.jpg"
      }
    ]
  end
end
