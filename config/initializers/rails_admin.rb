RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  config.model Conference do
    list do
      configure(:start_date) { strftime_format '%Y-%m-%d' }

      fields :name, :start_date, :ended, :created_at
    end

    show do
      configure(:start_date) { strftime_format '%Y-%m-%d' }
      configure :conference_members do
        pretty_value do
          members = bindings[:object].conference_members
          members.collect{ |member| "<a href='/admin/conference_member/#{member.id}'>#{member.full_name}</a>"}.join(", ").html_safe
        end
      end
      configure(:file_en){ pretty_value { "<a href='#{bindings[:object].file_en_url}'>#{bindings[:object].file_en_identifier}</a>".html_safe } }
      configure(:file_ua){ pretty_value { "<a href='#{bindings[:object].file_ua_url}'>#{bindings[:object].file_ua_identifier}</a>".html_safe } }
    end

    edit do
      configure(:start_date) { strftime_format '%Y-%m-%d' }

      exclude_fields :conference_members, :ended
    end
  end

  config.model ConferenceMember do
    parent Conference

    list do
      configure(:full_name)
      configure(:conference) { pretty_value { bindings[:view].content_tag(:a, "#{bindings[:object].conference.name}", href: "/admin/conference/#{bindings[:object].conference_id}") } }

      fields :conference, :full_name, :email, :phone
    end

    edit do
      configure(:academic_status, :enum) do
        enum { ['-', 'Доцент', 'Професор', 'Старший науковий співробітник', 'Старший дослідник'] }

        default_value '-'
      end

      configure :scientific_degree, :enum do
        enum { ['-', 'Кандидат наук', 'Доктор філософії', 'Доктор наук'] }

        default_value '-'
      end
    end

    show do
      configure :full_name

      field :full_name
      include_all_fields
      exclude_fields :first_name, :last_name, :surname
    end
  end

  config.model Monograph do
    list do
      fields :name, :authors, :author_email, :published
    end

    show do
      configure :monograph_editors do
        pretty_value do
          editors = bindings[:object].monograph_editors
          editors.collect{ |editor| "<a href='/admin/monograph_editor/#{editor.id}'>#{editor.full_name}</a>"}.join(", ").html_safe
        end
      end
      configure(:file){ pretty_value { "<a href='#{bindings[:object].file_url}'>#{bindings[:object].file_identifier}</a>".html_safe } }
    end

    edit do
      exclude_fields :monograph_editors
    end
  end

  config.model MonographEditor do
    parent Monograph

    list do
      field :monograph
      field :full_name do
        formatted_value{ bindings[:object].full_name }
      end

      fields :phone, :email
    end

    show do
      configure :full_name

      fields :full_name, :monograph, :email, :phone
    end
  end

  config.model News do
    list do
      fields :name, :created_at
    end
  end

  config.model Message do
    list do
      exclude_fields :_id, :updated_at, :phone
    end
  end

  config.actions do
    dashboard
    index
    new
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
