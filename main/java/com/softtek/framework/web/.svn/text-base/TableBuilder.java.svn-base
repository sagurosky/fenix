package com.softtek.framework.web;

import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.utils.Formateador;



// TODO: Auto-generated Javadoc
// 
/**
 * TableBuilder.
 *
 * @author Juan Irungaray
 */
public class TableBuilder {

	/**
	 * Builds the table html.
	 *
	 * @param jsonArray the json array
	 * @param listNameValues the list name values
	 * @param nameColumns the name columns
	 * @param nameTabla the name tabla
	 * @param isCheckBox the is check box
	 * @return the string
	 * @throws JSONException the exception
	 * @since 04-nov-2010
	 * @author cfigueroa
	 */
	public String buildTableHTML(JSONArray jsonArray,List<String> listNameValues,List<String> nameColumns,String nameTabla,boolean isCheckBox) throws JSONException{
		StringBuffer bufferHeaderTable = createHeaderTableHTML(nameTabla, nameColumns);
		String tableHtml = createRowsTableHtml(jsonArray, listNameValues, bufferHeaderTable,isCheckBox);
		return tableHtml;
	}
	
	/**
	 * Creates the header table html.
	 *
	 * @param nameTabla the name tabla
	 * @param nameColumns the name columns
	 * @return the string buffer
	 * @since 04-nov-2010
	 * @author cfigueroa
	 */
	private StringBuffer createHeaderTableHTML(String nameTabla,List<String> nameColumns){
		Iterator<String> iteNameColums = nameColumns.iterator();
		StringBuffer buffer = new StringBuffer();
		buffer.append("<table cellpadding='0' cellspacing='0' border='0' class='dataTables_wrapper' ");
		buffer.append("id= '");
		buffer.append(nameTabla);
		buffer.append("'>\n");
		buffer.append("	<thead>\n");
		buffer.append("		<tr>\n");
		while (iteNameColums.hasNext()) {
			String name = (String) iteNameColums.next();
			buffer.append("		<th>");
			buffer.append(name);
			buffer.append("</th>\n");
		}
		buffer.append("		</tr>\n");
		buffer.append("	</thead>\n");
		return buffer;
	}
	
	/**
	 * Creates the rows table html.
	 *
	 * @param jsonArray the json array
	 * @param listNameValues the list name values
	 * @param buffer the buffer
	 * @param isCheckBox the is check box
	 * @return the string
	 * @throws JSONException the jSON exception
	 * @since 04-nov-2010
	 * @author cfigueroa
	 */
	private String createRowsTableHtml(JSONArray jsonArray, List<String> listNameValues , StringBuffer buffer,boolean isCheckBox) throws JSONException{
		if(jsonArray.size() != 0 && listNameValues.size() != 0){
			buffer.append("<tbody>\n");
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				buffer.append("	<tr>\n");
				for (int j = 0; j < listNameValues.size(); j++) {
					String name = (String) listNameValues.get(j);// Lista de los nombres que tiene el objeto json
					buffer.append("<td align='center' valign='top' style='font-size: 14px' >");
					if(StringUtils.contains(name, ".")){
						JSONObject jsonObjectTemp = null;
						String [] arrayNames =StringUtils.split(name, ".");
						String key = null;
						for (int k = 0; k <arrayNames.length; k++) {
							if(k == 0 ){
								key = arrayNames[k] ;
								jsonObjectTemp = jsonObject.getJSONObject(key);
							}else{
								key = arrayNames[k] ;
								if(k == arrayNames.length -1 || jsonObjectTemp.isEmpty() ){
									break;
								}
								jsonObjectTemp = jsonObjectTemp.getJSONObject(key);
							}
						}
						populateBuffer(buffer, jsonObjectTemp, key);
					}else{
						populateBuffer(buffer, jsonObject, name);
					
					}
					buffer.append("</td>\n");
				}
				buffer.append("	</tr>\n");
			}
			buffer.append("</tbody>\n");
		}
		return buffer.toString();
	}
	
	/**
	 * Este metodo carga en el string buffer los valores para imprimir en pantalla
	 *
	 * @param buffer the buffer
	 * @param jsonObject the json object
	 * @param name the name
	 * @since 15-nov-2010
	 * @author cfigueroa
	 */
	private void populateBuffer(StringBuffer buffer, JSONObject jsonObject,
			String name) {
		if(jsonObject.isEmpty()){
			buffer.append("no contiene registros " );
		}else{
			try {
				JSONObject jsonObjecTmp = jsonObject.getJSONObject(name.trim());
				Long date = jsonObjecTmp.getLong("time"); 
			    buffer.append(Formateador.formatearFechas(new Date(date),"dd/MM/yyyy"));
			} catch (JSONException e) {
				buffer.append(jsonObject.get(name) == null ? "no contiene registros" : jsonObject.get(name) );
			}
			
		}
	}
	
	/**
	 * Creates the check box row.
	 *
	 * @param buffer the buffer
	 * @param isCheckBox the is check box
	 * @since 12-nov-2010
	 * @author cfigueroa
	 */
	private void createCheckBoxRow(StringBuffer buffer ,boolean isCheckBox){
		if(isCheckBox)
		buffer.append("<input type='checkbox' >");
		
	}
}
