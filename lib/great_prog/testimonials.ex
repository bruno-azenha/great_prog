defmodule GreatProg.Testimonials do
  alias GreatProg.Entities.Testimonial

  def get_all() do
    [
      %Testimonial{
        name: "Natalia Tykhonravova",
        text:
          "I highly recommend Bruno's coaching sessions to anyone looking to improve and succeed in their professional life. The support, guidance, and personalized attention have been invaluable. His coaching delivers transformative results.",
        avatar_filename: "natalia_tykhonravova.jpg"
      },
      %Testimonial{
        name: "Geison Biazus",
        text:
          "Bruno is a great engineer and a great person. He is the most welcoming person I ever knew. He's always seeking knowledge and promoting knowledge sharing between everyone in the team. He has excellent technical skills, is a real problem solver, and a great team player.",
        avatar_filename: "geison_biazus.jpeg"
      },
      %Testimonial{
        name: "Vince Urag",
        text:
          "Bruno actively promotes knowledge-sharing and writing clean code. He is very knowledgeable and an amazing listener. Most importantly, he's the most awesome friend you could ever have. Bruno is an amazing human being, and you would be very lucky to have him on your team.",
        avatar_filename: "vince_urag.jpeg"
      },
      %Testimonial{
        name: "Frederik Timmermans",
        text:
          "Bruno is blessed with many talents. He is amazing at explaining hard problems and solving them one step at a time. He lifts the skills and spirits of the people around him and has an insatiable curiosity for learning new things.",
        avatar_filename: "frederik_timmermans.jpeg"
      }
    ]
  end
end
