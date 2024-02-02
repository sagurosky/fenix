package com.softtek.framework.web;

import java.util.Scanner;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang.StringUtils;



/**
 * The Class JQueryTag.
 */
public class JQueryTag extends TagSupport{
	
	/** The nombre tabla. */
	private String nameTable;
	/** The disable colum sort. */
	private String disableColumSort;
	/** The disable filtre column. */
	private String disableFilterColumn;
	
	/** The url ajax. */
	private String urlAjax;
	

	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.TagSupport#doStartTag()
	 */
	@Override
	public int doStartTag() throws JspException {
		
		JspWriter out = pageContext.getOut();
		try {
			
			Scanner scanner = new Scanner( getClass().getResourceAsStream ("table_template.js"));
			StringBuffer buffer = new StringBuffer();
			try {
				while (scanner.hasNextLine()) {
					buffer.append(scanner.nextLine());
					buffer.append("\n");
				}
			} finally {
				scanner.close();
			}
			String jquery = StringUtils.replace(buffer.toString(), "$nameTable", "'#"+nameTable +"'");
			if(disableColumSort != null || disableFilterColumn != null ){
				jquery = StringUtils.replace(jquery, "$aoColumns", disableSortOrFiltre(disableColumSort,disableFilterColumn));
			}else{
				jquery = StringUtils.replace(jquery, "$aoColumns", "");
			}
			if(!StringUtils.isEmpty(urlAjax)){
				jquery = StringUtils.replace(jquery, "$urlAjax", createAjaxJquery(urlAjax));
			}else{
				jquery = StringUtils.replace(jquery, "$urlAjax", " ");
			}
			
			out.println(jquery);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}
	
	/**
	 * Creates the ajax jquery.
	 *
	 * @param url the url
	 * @return the string
	 * @since 05-nov-2010
	 * @author cfigueroa
	 */
	public String createAjaxJquery(String url){
		StringBuffer buffer = new StringBuffer();
		buffer.append(",");
		buffer.append("'bProcessing' : ");
		buffer.append(true);
		buffer.append(",");
		buffer.append("\n");
		buffer.append("'bServerSide' : ");
		buffer.append(true);
		buffer.append(",");
		buffer.append("\n");
		buffer.append("'sAjaxSource' : ");
		buffer.append("'");
		buffer.append(url);
		buffer.append("'");
		return buffer.toString();
	}
	/**
	 * Este metodo deshabilita el filtrado de las columnas o  el tag para ordenar la columna.
	 *
	 * @param disableSortColumns the disable sort columns
	 * @param disableFilterColumn the disable filter column
	 * @return the string
	 * @since 04-nov-2010
	 * @author cfigueroa
	 */
	private String disableSortOrFiltre(String disableSortColumns,String disableFilterColumn){
		String[] nombreColumnaArray =  StringUtils.split(disableSortColumns, ";");
		String[] disableFilreColums =StringUtils.split(disableFilterColumn, ";");
		int sizeSort = nombreColumnaArray.length;
		int sizeFiltre = disableFilreColums.length;
		boolean flag = false;
		StringBuffer buffer = new StringBuffer();
		buffer.append(",");
		buffer.append('"');
		buffer.append("aoColumns");
		buffer.append('"');
		buffer.append(": [ ");
		for (int i = 0; i < disableFilreColums.length; i++) {
			flag = true;
			buffer.append("/*");
			buffer.append(disableFilreColums[i]);
			buffer.append("*/ ");
			buffer.append("{");
			buffer.append("'bSearchable': ");
			buffer.append(false);
			buffer.append("}");
			if(sizeFiltre != 1 ){
				buffer.append(",");
			}
		}
		if(flag){
			buffer.append(",");
		}
		for (int i = 0; i < sizeSort; i++) {
			buffer.append("/*");
			buffer.append(nombreColumnaArray[i]);
			buffer.append("*/ ");
			buffer.append("{");
			buffer.append("'bSortable': ");
			buffer.append(false);
			buffer.append("}");
			if(sizeSort != 1 ){
				buffer.append(",");
			}
		}
		buffer.append("]");
		return buffer.toString();
	}
	
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.TagSupport#doEndTag()
	 */
	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}
	
	/**
	 * Gets the disable colum sort.
	 *
	 * @return the disable colum sort
	 * @since 04-nov-2010
	 * @author cfigueroa
	 */
	public String getDisableColumSort() {
		return disableColumSort;
	}
	
	/**
	 * Sets the disable colum sort.
	 *
	 * @param disableColumSort the new disable colum sort
	 * @since 04-nov-2010
	 * @author cfigueroa
	 */
	public void setDisableColumSort(String disableColumSort) {
		this.disableColumSort = disableColumSort;
	}

	/**
	 * Gets the name table.
	 *
	 * @return the name table
	 * @since 04-nov-2010
	 * @author cfigueroa
	 */
	public String getNameTable() {
		return nameTable;
	}

	/**
	 * Sets the name table.
	 *
	 * @param nameTable the new name table
	 * @since 04-nov-2010
	 * @author cfigueroa
	 */
	public void setNameTable(String nameTable) {
		this.nameTable = nameTable;
	}

	/**
	 * Gets the disable filter column.
	 *
	 * @return the disable filter column
	 * @since 04-nov-2010
	 * @author cfigueroa
	 */
	public String getDisableFilterColumn() {
		return disableFilterColumn;
	}

	/**
	 * Sets the disable filter column.
	 *
	 * @param disableFilterColumn the new disable filter column
	 * @since 04-nov-2010
	 * @author cfigueroa
	 */
	public void setDisableFilterColumn(String disableFilterColumn) {
		this.disableFilterColumn = disableFilterColumn;
	}

	public String getUrlAjax() {
		return urlAjax;
	}

	public void setUrlAjax(String urlAjax) {
		this.urlAjax = urlAjax;
	}

}
