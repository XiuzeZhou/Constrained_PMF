function [out]=dg(x)
out=-exp(-x)./(1+exp(-x)).^2;
end