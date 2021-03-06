class Pokemon
@@all= []

attr_accessor :id, :name, :type, :db

  def initialize(id:, name: "", type: "", db: @db)
    @id = id
    @name = name
    @type = type
    @db = @db

    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id,db)
    pokemon = db.execute("SELECT * FROM pokemon where id = ?", id)

    Pokemon.new(id: id, name: pokemon[0][1], type: pokemon[0][2], db: db)
  end

end
