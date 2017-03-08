package example.jooq;

import org.jooq.util.DefaultGeneratorStrategy;
import org.jooq.util.Definition;

public class CamelCaseStrategy extends DefaultGeneratorStrategy {

    @Override
    public String getJavaIdentifier(Definition definition) {
        return org.jooq.tools.StringUtils.toCamelCaseLC(definition.getOutputName());
    }

}
