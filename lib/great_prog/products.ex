defmodule GreatProg.Products do
  alias GreatProg.Entities.Product

  def get_all() do
    [
      %Product{
        name: "Complimentary Strategy Session",
        description_paragraphs: [
          "Experience the power of focused coaching with this complimentary 45-minute session designed specifically for tech leaders.",
          "We'll identify your most pressing leadership challenge and develop at least one actionable strategy you can implement immediately.",
          "You'll leave with clarity on your next steps and a taste of how transformative our coaching relationship could be for your career.",
          "This session is perfect for tech leaders who are curious about coaching and want to experience real results before committing to a longer program."
        ],
        link: "https://calendly.com/coach-bruno/have-an-insight",
        link_text: "Book Your Free Strategy Session",
        product_image_filename: "hero_mobile.jpg"
      },
      %Product{
        name: "Leadership Transformation Program (3 Months)",
        description_paragraphs: [
          "This comprehensive coaching program is designed for tech leaders ready to dramatically elevate their leadership effectiveness and quality of life.",
          "Over three months, we'll work through a structured framework addressing your specific challenges in communication, team dynamics, strategic decision-making, and sustainable performance.",
          "The program includes bi-weekly 60-minute coaching sessions, personalized action plans after each session, unlimited email support, and emergency check-ins when you need them most.",
          "Past clients have reported significant improvements in team performance, reduced workplace stress, enhanced work-life balance, and career advancement opportunities."
        ],
        link: "https://calendly.com/coach-bruno/have-an-insight",
        link_text: "Schedule Your Discovery Call",
        product_image_filename: "sitting_chair_vertical.jpg"
      },
      %Product{
        name: "Team & Leadership Workshops",
        description_paragraphs: [
          "Bring transformative learning experiences to your entire engineering team or leadership group with these customized, interactive workshops.",
          "Popular topics include 'Effective Communication for Technical Teams', 'Building Psychological Safety in Engineering Cultures', and 'Sustainable High Performance Without Burnout'.",
          "Each workshop combines evidence-based frameworks with practical exercises designed specifically for technical professionals, ensuring immediate application to your team's challenges.",
          "Workshops can be delivered remotely or in-person for groups of 5-25 participants, with follow-up materials to ensure lasting impact."
        ],
        link: "https://calendly.com/coach-bruno/have-an-insight",
        link_text: "Discuss Your Workshop Needs",
        product_image_filename: "appreciation_wall.jpg"
      }
    ]
  end
end
