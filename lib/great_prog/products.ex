defmodule GreatProg.Products do
  alias GreatProg.Entities.Product

  def get_all() do
    [
      %Product{
        name: "Insightful Call",
        description_paragraphs: [
          "I enjoy having conversations with people and am always happy to help.",
          "This is a limited time free 1:1 call in which we can go deep and laser-focused on a topic of your choice.",
          "Maybe you are excited with a new project, maybe you are struggling with some aspect of your life.",
          "Come with a desire for action and to make things better and we're sure to have a great productive time."
        ],
        link: "https://calendly.com/coach-bruno/have-an-insight",
        link_text: "Book a Free Insightful Call",
        product_image_filename: "hero_mobile.jpg"
      },
      %Product{
        name: "3-month package",
        description_paragraphs: [
          "This is the option for you if you are ready to commit to your growth and are looking for a partner to help you along the way.",
          "We work together over the course of 3 months, including calls at least once every two weeks and unlimited support via email and whatsapp.",
          "Be prepared to go deep evaluating your mindsets and beliefs, setting goals and taking action towards the future you will create.",
          "Book a discovery call and let's discuss how I can help you."
        ],
        link: "https://calendly.com/coach-bruno/have-an-insight",
        link_text: "Book a Discovery Call",
        product_image_filename: "sitting_chair_vertical.jpg"
      },
      %Product{
        name: "Book a Workshop",
        description_paragraphs: [
          "I am available to give workshops on a variety of topics. I have a few that are ready to go, but I am also happy to create a custom one for your group.",
          "I have experience with groups of around 20 adult and am always happy to share my knowledge and experience.",
          "Book a call and let's discuss how I can help your group."
        ],
        link: "https://calendly.com/coach-bruno/have-an-insight",
        link_text: "Book a Workshop Discovery Call",
        product_image_filename: "appreciation_wall.jpg"
      }
    ]
  end
end
