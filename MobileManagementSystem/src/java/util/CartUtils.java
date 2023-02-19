/*
 * Copyright 2022 Fangl
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Fangl
 * which accompanies this distribution, and is available at
 * https://github.com/fanglong-it
 *
 * Contributors:
 *    Fangl - initial API and implementation and/or initial documentation
 */
package util;

import dto.ProductDTO;
import java.awt.RenderingHints;
import java.text.DecimalFormat;
import java.util.Collection;
import java.util.HashMap;
import java.util.Set;

/**
 *
 * @author MY PC
 */
public class CartUtils {

    public static double getTotalPrice(HashMap<Integer, ProductDTO> cart) {
        double result = 0;
        Collection<ProductDTO> productDTOs = cart.values();
        for (ProductDTO productDTO : productDTOs) {
            result += (productDTO.getQuantity() * productDTO.getPrice());
        }
        DecimalFormat df = new DecimalFormat("0.00");
        return Double.valueOf(df.format(result));
    }

}
