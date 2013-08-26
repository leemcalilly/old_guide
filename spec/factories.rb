FactoryGirl.define do
  factory :user do
    name                    "Alex Chilton"
    sequence(:email)        { |n| "person_#{n}@example.com"}
    password                "secret"
    
    factory :admin do
      after(:create) {|user| user.add_role(:admin)}
    end
  end
  
  factory :lesson do
    sequence(:title)  { |n| "Example Lesson No. #{n}"}
    date              "2013-05-19"        
    description       "In the beginning, there was the G Chord. This little fingering is the most common of all chords and is used by everyone from Jeff Mangum to Andre 3000. In this lesson you'll learn how to play this fundamental chord."    
    featured_photo    "/images/photo.jpg"
    level             "Beginner"
    genre             "Psychedelic"
    topic             "Gear"
    article           "Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime. Do you believe that shit? It actually says that in the little book that comes with it: the most popular gun in American crime. Like they're actually proud of that shit. Normally, both your asses would be dead as fucking fried chicken, but you happen to pull this shit while I'm in a transitional period so I don't wanna kill you, I wanna help you. But I can't give you this case, it don't belong to me. Besides, I've already been through too much shit this morning over this case to hand it over to your dumb ass."
    video             "Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends."
    resources         "Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows."
    visibility        "Published"
  end
end