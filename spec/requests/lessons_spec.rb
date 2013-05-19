require 'spec_helper'

describe "Lessons" do    
  
  describe "Index" do
    it "renders the lessons index page" do
      visit '/lessons'
      page.status_code.should be(200)
    end
    
    it "has the right content" do
      visit '/lessons'
      page.should have_content("Lessons")
    end
    
    it "has the right title" do
      visit '/lessons'
      page.should have_selector('title',
                          :text => "Lessons < The Fuzz Guide to Guitar")
    end
    
    it "has the right body class" do
      visit '/lessons'
      page.should have_selector('body',
                          :class => "lessons")
    end

    it "has the right body id" do
      visit '/lessons'
      page.should have_selector('body',
                          :id => "index")
    end
  end
  
  describe "Show" do
    it "renders the lesson show page" do
     visit '/lessons/how-to-play-a-g-chord'
     page.status_code.should be(200)
    end

    it "has the right content" do
     visit '/lessons/how-to-play-a-g-chord'
     page.should have_content("How to Play a G Chord")
    end

    it "has the right title" do
     visit '/lessons/how-to-play-a-g-chord'
     page.should have_selector('title',
                         :text => "How to Play a G Chord < The Fuzz Guide to Guitar")
    end

    it "has the right body class" do
     visit '/lessons/how-to-play-a-g-chord'
     page.should have_selector('body',
                         :class => "lessons")
    end

    it "has the right body id" do
     visit '/lessons/how-to-play-a-g-chord'
     page.should have_selector('body',
                         :id => "show")
    end
  end
  
  describe "New" do
    it "renders the new page" do
     visit '/lessons/new'
     page.status_code.should be(200)
    end

    it "has the right content" do
     visit '/lessons/new'
     page.should have_content("New Lesson")
    end

    it "has the right title" do
     visit '/lessons/new'
     page.should have_selector('title',
                         :text => "New Lesson < The Fuzz Guide to Guitar")
    end

    it "has the right body class" do
     visit '/lessons/new'
     page.should have_selector('body',
                         :class => "lessons")
    end

    it "has the right body id" do
     visit '/lessons/new'
     page.should have_selector('body',
                         :id => "new")
    end
  end
  
  describe "Edit" do
    it "renders the lesson edit page" do
     visit '/lessons/how-to-play-a-g-chord/edit'
     page.status_code.should be(200)
    end

    it "has the right content" do
     visit '/lessons/how-to-play-a-g-chord/edit'
     page.should have_content("Edit Lesson")
    end

    it "has the right title" do
     visit '/lessons/how-to-play-a-g-chord/edit'
     page.should have_selector('title',
                         :text => "Edit Lesson < The Fuzz Guide to Guitar")
    end

    it "has the right body class" do
     visit '/lessons/how-to-play-a-g-chord/edit'
     page.should have_selector('body',
                         :class => "lessons")
    end

    it "has the right body id" do
     visit '/lessons/how-to-play-a-g-chord/edit'
     page.should have_selector('body',
                         :id => "edit")
    end
  end
end