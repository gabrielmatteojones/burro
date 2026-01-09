require 'json'

module Jekyll
  class LibriGenerator < Generator
    safe true

    def generate(site)
      libri = []

      site.collections['libri'].docs.each do |doc|
        libri << {
          'title' => doc.data['title'],
          'author' => doc.data['author'],
          'content' => doc.content,
          'url' => doc.url
        }
      end

      File.open(File.join(site.dest, 'libri.json'), 'w') do |f|
        f.write(JSON.pretty_generate(libri))
      end
    end
  end
end
