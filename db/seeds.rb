unless Rails.env.production?
    connection = ActiveRecord::Base.connection
    # connection.tables.each do |table|
    #   connection.execute("TRUNCATE #{table}") unless table == "schema_migrations"
    # end
  
    sql = File.read('db/development.sql')
    statements = sql.split(/;$/)
    statements.pop
  
    ActiveRecord::Base.transaction do
      statements.each do |statement|
        Rails.logger.info statement
        connection.execute(statement)
      end
    end
  end
