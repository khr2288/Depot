class AddTestData < ActiveRecord::Migration
  def self.up
    Product.delete_all

    Product.create(
                    :title => 'Agile Web Development with Rails',
                    :description => %{With this book, you'll learn how to use <b>ActiveRecord</b> to connect
                                      business objects and database tables. No more painful object-relational
                                      mapping. Just create your business objects and let Rails do the rest. Need
                                      to create and modify your schema? Migrations make it painless (and they're
                                      versioned, so you can roll changes backward and forward). You'll learn how
                                      to use the Action Pack framework to route incoming requests and render pages
                                      using easy-to-write templates and components. See how to exploit the Rails
                                      service frameworks to send emails, implement web services, and create dynamic,
                                      user-centric web-pages using built-in Javascript and Ajax support. There is
                                      extensive coverage of testing, and the rewritten Deployment chapter now covers
                                      Phusion Passenger.},
                    :image_url => '/images/agilewebdevptrails.jpg',
                    :price => 28
                  )

    Product.create(
                    :title => 'Prioritizing Web Usability',
                    :description => %{The best-selling usability guru is back and has revisited his classic guide,
                                      joined forces with Web usability consultantHoa Loranger, and created an
                                      updated companion book that covers the essential changes to the Web and
                                      usability today. Prioritizing Web Usability is the guide for anyone who
                                      wants to take their Web site(s) to next level and make usability a priority!
                                      Through the authors’ wisdom, experience, and hundreds of real-world user
                                      tests and contemporary Web site critiques, you’ll learn about site design,
                                      user experience and usability testing, navigation and search capabilities,
                                      old guidelines and prioritizing usability issues, page design and layout,
                                      content design, and more!},
                    :image_url => '/images/webusability.jpg',
                    :price => 18
                  )

    Product.create(
                    :title => 'Creating Web Sites: The Missing Manual',
                    :description => %{For anyone who wants to create an engaging web site-for either personal or
                                      business purposes - "Creating Web Sites: The Missing Manual" demystifies the
                                      process and provides tools, techniques, and expert guidance for developing a
                                      professional and reliable Web presence. Like every Missing Manual, you can
                                      count on "Creating Web Sites: The Missing Manual" to be entertaining and
                                      insightful and complete with all the vital information, clear-headed advice,
                                      and detailed instructions you need to master the task at hand. Author
                                      Matthew MacDonald teaches you the fundamentals of creating, maintaining, and
                                      updating an effective, attractive, and visitor-friendly web site-from
                                      scratch or from an existing site that's a little too simple and flat for
                                      your liking. "Creating Web Sites: The Missing Manual" doesn't only cover
                                      how to create a well-designed, appealing, smart web site that is thoroughly
                                      up to date and brimming with the latest features. It also covers why it's
                                      worth the effort by explaining the rationale for creating a site in the
                                      first place and discussing what makes a given web site particularly
                                      aesthetic, dynamic, and powerful. It further helps you determine your needs
                                      and goals and make well informed design and content decisions. "Creating Web
                                      Sites: The Missing Manual" includes a basic primer on HTML, working with
                                      JavaScript, and incorporating services like Paypal's shopping cart, Amazon's
                                      associate program, and Google AdSense and AdWords. It delivers advanced
                                      tricks for formatting, graphics, audio and video, as well as Flash animation
                                      and dynamic content. And you'll learn how to identify and connect with your
                                      site's audience through forms, forums, meta tags, and search engines. This
                                      isn't just another dry, uninspired book on how to create a web site.
                                      "Creating Web Sites: The Missing Manual" is a witty and intelligent guide
                                      for all of you who are ready to make your ideas and vision a Web reality.},
                    :image_url => '/images/createwebsites.jpg',
                    :price => 18
                  )
  end

  def self.down
    Product.delete_all
  end
end
