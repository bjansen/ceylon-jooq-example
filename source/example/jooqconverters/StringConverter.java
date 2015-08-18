package example.jooqconverters;

import org.jooq.Converter;

public class StringConverter implements Converter<String, ceylon.language.String> {
  
  @Override
  public ceylon.language.String from(String databaseObject) {
      return new ceylon.language.String(databaseObject);
  }
  
  @Override
  public String to(ceylon.language.String userObject) {
      return userObject.value;
  }
  
  @Override
  public Class<String> fromType() {
      return String.class;
  }
  
  @Override
  public Class<ceylon.language.String> toType() {
      return ceylon.language.String.class;
  }
  
}
