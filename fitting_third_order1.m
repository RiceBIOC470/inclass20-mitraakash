function fitting_third_order1(fit_str, xdat, ydat, ydat2)

fitmodel = fittype(fit_str);

[fit_out, fit_metric] = fit(xdat',ydat', fitmodel);
plot(fit_out, xdat',ydat')

fitmodel4 = fittype(fit_str, 'problem',{'K'});
[fit_out4, fit_metric4] = fit(xdat',ydat', fitmodel4, 'problem', 100,'StartPoint', [10] );
plot(fit_out4, xdat',ydat')

[fit_out2, fit_metric2] = fit(xdat',ydat2', fitmodel,'StartPoint', [10, 10]);
plot(fit_out2, xdat',ydat2')

fitmodel3 = fittype(fit_str, 'problem','K');
[fit_out3, fit_metric3] = fit(xdat',ydat2', fitmodel3, 'problem', 1000);
plot(fit_out3, xdat',ydat2')

fitmodel5 = fittype(fit_str);
[fit_out5, fit_metric5] = fit(xdat',ydat', fitmodel5);
plot(fit_out5, xdat',ydat')