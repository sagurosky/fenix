/**
 * 
 */
package org.cimientos.intranet.dao.base;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.commons.beanutils.PropertyUtils;
import org.hibernate.Query;

/**
 * @author plabaronnie
 * Esta clase se utiliza para mejorar la performance de las consultas con hql.
 */
public class HQLHelper {

	/**
	 * @param query
	 * @return
	 */
	private static String extractFromClause(final String query) {
        int fromPosition = query.toLowerCase().indexOf("from");
        if (fromPosition >= 0) {
        	return query.substring(fromPosition);
        } else {
        	return query;
        }
    }	
	
	/**
	 * @param hqlQuery
	 * @param beanClass
	 * @return
	 * @throws Exception
	 */
	public static List find(final Query hqlQuery, Class<?> beanClass) {

		List results = new ArrayList();
		
//		String hqlFromClause = extractFromClause(hqlQuery.getQueryString());

		//
		// Prepare a Hibernate query
		//
//		Query query = getSession().createQuery(hqlQuery);
		//
		// Determine the return type for this query
		//
//		Type beanType = query.getReturnTypes()[0];
//		Class beanClass2 = beanType.getReturnedClass();
		//
		// Extract the list of columns returned by this query
		//
		String[] columns = extractColumns(hqlQuery.getQueryString());
		//
		// Pre-process bean attribute names, stripping spaces 'as' clauses
		//
		String[] attributeNames = getAttributeFieldNames(columns);
		//
		// Pre-process result field names, stripping spaces and retaining
		// alias field names instead of the original column names where necessary
		//
//		String[] resultFieldNames = getResultFieldNames(columns);
		//
		// Execute query and build result list
		//
		Iterator iter = hqlQuery.iterate();
		try {
			while(iter.hasNext()) {
				  Object[] row = (Object[]) iter.next();
				  Object bean = beanClass.newInstance();
				  for (int j = 0; j < row.length; j++) {
					if (row[j] != null) {
						initialisePath(bean, attributeNames[j]);
						PropertyUtils.setProperty(bean, attributeNames[j], row[j]);
					}
				  }
				  results.add(bean);
			}
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return results;
	}


	/**
	 * @param hqlQuery
	 * @return
	 */
    private static String[] extractColumns(final String query) { int fromPosition = query.toLowerCase().indexOf("from");
           int selectPosition = query.toLowerCase().indexOf("select");
           if (selectPosition >= 0) {
           	String columns = query.substring(selectPosition + 6,fromPosition);
               StringTokenizer st = new StringTokenizer(columns,",");
               List columnList = new ArrayList();
               while (st.hasMoreTokens()) {
                   columnList.add(st.nextToken().trim());
               }
               return (String[]) columnList.toArray(new String[0]);
           } else {
           	return null;
           }
       }

    /**
     * @param fieldNames
     * @return
     */
    private static String[] getAttributeFieldNames(final String[] fieldNames) {
       	ArrayList list = new ArrayList();
           for(int i = 0; i < fieldNames.length; i++) {
           	list.add(getAttributeFieldName(fieldNames[i]));
           }
           return (String[]) list.toArray(new String[0]);
       }

    /**
     * @param fieldName
     * @return
     */
    private static String getAttributeFieldName(final String fieldName) {
        int dot = fieldName.indexOf('.');
        String trimmedFieldName = null;
        String normalisedFieldName = null;
        if (dot >= 0) {
            trimmedFieldName = fieldName.substring(dot + 1);
        } else {
            trimmedFieldName = fieldName;
        }
        
        int asClause = trimmedFieldName.toLowerCase().indexOf(" as ");
        if (asClause > 0) {
            normalisedFieldName = trimmedFieldName.substring(0,asClause);
        } else {
            normalisedFieldName = trimmedFieldName; 
        }
        return normalisedFieldName;
    }    

	/**
	 * @param bean
	 * @param fieldName
	 * @throws Exception
	 */
	private static void initialisePath(final Object bean,
									   final String fieldName)
		throws Exception {
		int dot = fieldName.indexOf('.');
		while (dot >= 0) {
			String attributeName = fieldName.substring(0, dot);
			Class attributeClass = PropertyUtils.getPropertyType(bean, attributeName);
			if (PropertyUtils.getProperty(bean, attributeName) == null) {
				PropertyUtils.setProperty(bean, attributeName, attributeClass.newInstance());
			}
			dot = fieldName.indexOf('.', dot + 1);
		}
	}


}
