# 2. CORRELATION

# Plot
corr = cor(train[, 3:24])
corrplot(corr, method = "color",
         outline = T,
         cl.pos = "n",
         rect.col = "black",
         tl.col = "indianred4",
         addCoef.col = "black",
         number.digits = 2,
         number.cex = 0.60,
         tl.cex = 0.7,
         cl.cex = 1,
         col = colorRampPalette(c("red", "white", "green4")) (100))