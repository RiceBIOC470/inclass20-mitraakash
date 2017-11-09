function fitting_third_order2(fit_str, xdat, ydat)

fitmodel5 = fittype(fit_str);
[fit_out5, fit_metric5] = fit(xdat',ydat', fitmodel5);
plot(fit_out5, xdat',ydat')