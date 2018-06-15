conferences = Faker::Number.between(5, 10)
scientific = Faker::Number.between(5, 10)
monograph = Faker::Number.between(10, 15)
news_count = Faker::Number.between(5, 10)
documents = Faker::Number.between(5, 10)

conferences.times do
  date = Faker::Date.between(Date.today - 365, Date.today + 365)
  ended = date >= Date.today ? false : true

  conference = Conference.create!(
    name: Faker::Educator.course,
    description: Faker::Lorem.paragraph(50),
    start_date: date,
    ended: ended,
    file_ua: Rails.root.join('public/Test_book.pdf').open,
    file_en: Rails.root.join('public/Test_book.pdf').open
  )

  documents.times do
    conference.documents.create!(
      name: Faker::Educator.course,
      file: Rails.root.join('public/Test_book.pdf').open
    )
  end if conference.ended
end

monograph.times do
  authors_count = Faker::Number.between(1, 3)
  authors = ''
  ended = Faker::Boolean.boolean(0.5)

  monograph = Monograph.new(
    name: Faker::Educator.course,
    author_email: Faker::Internet.email,
    published: ended
  )

  monograph.file = Rails.root.join('public/Test_book.pdf').open if ended

  authors_count.times do
    if authors_count == 1
      authors = Faker::Book.author
    else
      if authors == ''
        authors = Faker::Book.author
      else
        authors += ", #{Faker::Book.author}"
      end
    end
  end

  monograph.authors = authors

  monograph.save
end

Monograph.each do |monograph|
  editors_count = Faker::Number.between(10, 50)

  editors_count.times do
    monograph.monograph_editors.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      surname: Faker::Name.prefix,
      phone: Faker::PhoneNumber.phone_number,
      email: Faker::Internet.email
    )
  end
end

Conference.each do |conference|
  members_count = Faker::Number.between(10, 50)

  members_count.times do
    conference.conference_members.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      surname: Faker::Name.prefix,
      position: Faker::Book.author,
      organization: Faker::Book.author,
      contry: Faker::Address.country,
      city: Faker::Address.city,
      address: Faker::Address.street_address,
      email: Faker::Internet.email,
      academic_status: Faker::Book.genre,
      scientific_degree: Faker::Book.genre,
      phone: Faker::PhoneNumber.phone_number
    )
  end
end

news_count.times do
  News.create!(
    name: Faker::Educator.course,
    description: Faker::Lorem.paragraph(20)
  )
end

Admin.create!(
  email: 'test.email@com',
  username: 'admin',
  password: 'admin1'
)
