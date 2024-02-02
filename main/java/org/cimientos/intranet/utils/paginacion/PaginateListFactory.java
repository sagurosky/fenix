package org.cimientos.intranet.utils.paginacion;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.displaytag.properties.SortOrderEnum;
import org.displaytag.tags.TableTagParameters;
import org.displaytag.util.ParamEncoder;
import org.springframework.stereotype.Component;


/**
 * @author plabaronnie
 *
 */
@Component
public class PaginateListFactory {

    public ExtendedPaginatedList getPaginatedListFromRequest(
            HttpServletRequest request) {

        ExtendedPaginatedList paginatedList = new PaginatedListImpl();
        String sortCriterion = null;
        String thePage = null;
        if (request != null) {
            sortCriterion = request
                    .getParameter(ExtendedPaginatedList.IRequestParameters.SORT);
            paginatedList
                    .setSortDirection(ExtendedPaginatedList.IRequestParameters.DESC
                            .equals(request
                                    .getParameter(ExtendedPaginatedList.IRequestParameters.DIRECTION)) ? SortOrderEnum.DESCENDING
                            : SortOrderEnum.ASCENDING);
            thePage = request
                    .getParameter(ExtendedPaginatedList.IRequestParameters.PAGE);
        }
        paginatedList.setSortCriterion(sortCriterion);
        int pageSize = 50; // Rows per page
        paginatedList.setPageSize(pageSize);
        if (StringUtils.isNotBlank(thePage)) {
            int index = paginatedList == null ? 0
                    : Integer.parseInt(thePage) - 1;
            paginatedList.setIndex(index);
        } else {
            paginatedList.setIndex(0);
        }

        return paginatedList;
    }
}