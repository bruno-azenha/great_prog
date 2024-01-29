defmodule GreatProg.Testimonials do
  alias GreatProg.Entities.Testimonial

  def get_all() do
    [
      %Testimonial{
        name: "John Doe",
        text:
          "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
        avatar_url: "https://avatars.githubusercontent.com/u/1?v=4"
      },
      %Testimonial{
        name: "Jane Doe",
        text:
          "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
        avatar_url: "https://avatars.githubusercontent.com/u/2?v=4"
      },
      %Testimonial{
        name: "John Smith",
        text:
          "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
        avatar_url: "https://avatars.githubusercontent.com/u/3?v=4"
      },
      %Testimonial{
        name: "Jeff Smith",
        text:
          "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
        avatar_url: "https://avatars.githubusercontent.com/u/4?v=4"
      }
    ]
  end
end
