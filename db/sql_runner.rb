require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect( {dbname: 'd5pscfpdpev5ih',
          host: 'ec2-54-243-147-162.compute-1.amazonaws.com',
          port: 5432, user: 'mkrbocnfbivxyo', password: '7b416faf1ed5ea1d1c9be93669b4a658a76fd33fc3a7cd08653274b68416911f'})
      # local DB connection
      # db = PG.connect({ dbname: 'boxing_gym', host: 'localhost' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end


end
