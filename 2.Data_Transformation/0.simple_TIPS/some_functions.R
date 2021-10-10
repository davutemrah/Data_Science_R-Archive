
# make columns free
attach(data)

# make data freame again
detach()


set.seed(13435)

x <- data.frame("var1" = sample(1:5),
                "var2" = sample(6:10),
                "var3" = sample(11:15))


sample(1:5)