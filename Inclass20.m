%Inclass 20

%In this folder you will find a .mat file with x and y data

% For all of the questions below, use any options as necessary to get a
% good fit - starting points, lower bounds etc. 

% 1. Define a custom model and try to fit the data to a Michaelis function 
% y = V*x/(K+x). 

data = load('data.mat');

fit_str = 'V*x/(K+x)';
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


% 2. Use a custom model to try to fit the data to a Hill function with
% exponent 2: y = V*x^2/(K^2+x^2)

fit_str2 = 'V*x^2/(K^2+x^2)';
fitmodel5 = fittype(fit_str2);
[fit_out5, fit_metric5] = fit(xdat',ydat', fitmodel5);
plot(fit_out5, xdat',ydat')


% 3. Now treat the exponent as a free parameter and perform the fit again,
% that is fit to the model y = V*x^n/(K^n+x^n)

fit_str3 = 'V*x^n/(K^n+x^n)';
fitmodel6 = fittype(fit_str3, 'problem',{'V','K'});
coeffnames(fitmodel6)
[fit_out6, fit_metric6] = fit(xdat',ydat',fitmodel6, 'problem', {1000000, 1000000});
plot(fit_out6, xdat',ydat')


% 4. Redo parts 1 and 2, but using your model from 3 and fixing the value of
% n to either 1 or 2.

fitting_third_order1('V*x^1/(K^1+x^1)', xdat, ydat, ydat2);
fitting_third_order1('V*x^2/(K^2+x^2)', xdat, ydat, ydat2);

fitting_third_order2('V*x^1/(K^1+x^1)', xdat, ydat);
fitting_third_order2('V*x^2/(K^2+x^2)', xdat, ydat);

