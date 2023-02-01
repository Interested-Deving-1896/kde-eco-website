---
author: KDE Eco
date: 30 January 2023
title: Applying The Blue Angel Criteria To Free Software
subtitle: "The Handbook"
lang: "en"
titlepage: true,
titlepage-rule-color: "360049"
titlepage-background: "background8.pdf"
toc: true
toc-own-page: true
---


# About The Authors

KDE Eco tooling and documentation are provided by community members who have volunteered to contribute to this project for the benefit of all. Primary contributors include (listed in alphabetical order by first name): Arne Tarara, Cornelius Schumacher, David Hurka, Emmanuel Charruau, Karanjot Singh, Nicolas Fella, and Volker Krause. Your contributions make this handbook possible.

The text of this version of the handbook was written and/or compiled from the above documentation by Joseph P. De Veaugh-Geiss. Olea Morris helped edit the text. Lana Lutz and Arwin Neil Baichoo made the book and website design as well as the images therein beautiful. Paul Brown made significant improvements to the Okular blog post which was included in modified form in [Part II: First Eco-Certified Computer Program: KDE's Popular Document Reader Okular](#sec:sec:okular). Wikipedia was a source of several useful texts which were included here in modified form: thank you to the community of Wikipedia writers and editors. See the end of each section for additional information about sources.

# Acknowledgments

Thank you to the many contributors to the KDE Eco initiative in general (listed in alphabetical order by first name): Achim Guldner, Adriaan de Groot, Aleix Pol, Alexander Semke, André Pönitz, Björn Balazs, Carl Schwan, Chris Adams, Christopher Stumpf, Fabian, Franziska Mai, Harald Sitter, Johnny Jazeix, Jonathan Esk-Riddell, Kira Obergöker, Lydia Pintscher, Max Schulze, Phu Nguyen, Sami Shalayel, Stefan Naumann, Sven Köhler, and Tobias Fella. Your contributions are greatly appreciated.

People who are interested in contributing to KDE Eco are encouraged to express interest at the [mailing list](https://mail.kde.org/cgi-bin/mailman/listinfo/energy-efficiency) or [Matrix room](https://webchat.kde.org/#/room/#energy-efficiency:kde.org). Contributors are also invited to join one of the KDE Eco sprints and in-person or online meetups. Learn more at out website: <https://eco.kde.org/get-involved/>

There were additionally many informative conversations that happened at one of these conferences or workshops: Akademy 2022, Linux App Summit 2022, rC3: NOWHERE 2021, SFSCon 2021/2022, Grazer Linuxtage 2022, Qt World Summit 2022, QtDevCon 2022, Fedora Nest 2022, Green Coding Berlin meetups, Sustainable Digital Infrastructure Alliance hackathon, EnviroInfo 2022, and Bits & Bäume 2022. Thank you!

# License

Unless indicated otherwise, the contents of this handbook are released under the <a href="https://spdx.org/licenses/CC-BY-SA-4.0.html">Creative Commons Attribution-Share-Alike License 4.0 (CC-BY-SA 4.0)</a>. For more information about documentation licensing at KDE, see [KDE's licensing policy](https://community.kde.org/Policies/Licensing_Policy).

# Introduction

This text is a handbook for measuring the energy consumption of desktop software. It uses the Blue Angel ecolabel, the official environmental label of the German government, as a guide.

The Blue Angel ecolabel is awarded to a range of products and services. In 2020 the German Environment Agency (UBA) extended the award criteria to include software products. It was the first environmental certification in the world to link transparency and user autonomy with sustainability.

After reading this handbook you will have the information you need to measure the energy consumption of your software and apply for Blue Angel eco-certification for your software project. The handbook has the following structure:

 - PART I: Environmental Impact Of Software
 - PART II: Eco-Certifying Desktop Software
 - PART III: Fulfilling The Blue Angel Award Criteria

At this point you may be wondering how something as immaterial as software has an environmental impact?

Part I of this handbook seeks to answer this question by taking a closer look at some of the ways digital technology, and in particular software, is contributing to environmental harm and the climate crisis.

Once problems driven by software are identified, Part II will discuss the Blue Angel, how the award criteria for software addresses many of the problems in the first section, and what the process for eco-certification entails.

Part III provides a step-by-step guide to fullfilling the ABCs of the award criteria: (A) Resource & Energy Efficiency, (B) Potential Hardware Operating Life, and (C) User Autonomy.
 
If you are already familiar with sustainability issues related to software, you can skip Part I.

If you are already familiar with the Blue Angel ecolabel and the award criteria for desktop software, you can skip Part II.

We hope this handbook provides you and your team not only information about how to measure and eco-certify your software project, but also why it is important.

# PART I: Environmental Impact Of Software

![Image of e-waste (image published under a [CC0](https://creativecommons.org/share-your-work/public-domain/cc0/) public domain license).](images/sec1_e-waste.jpg)

In 2021, the Association of Computing Machinery (ACM), the oldest scientific and educational computing society in the world, released a Technology Policy Council report entitled "[Computing And Climate Change](https://dl.acm.org/doi/pdf/10.1145/3483410)." Among other findings, the techbrief explores the exponential increase in energy and resource consumption of internet-connected devices and artificial intelligence. The report's estimates are alarming. In 2021 alone, the Information and Communication Technology (ICT) sector is estimated to contribute between 1.8&ndash;3.9% of global carbon emissions. To put this into perspective, the aviation industry is estimated to contribute 2.5% of all global emissions. Perhaps most alarmingly, the report warns that if nothing is changed, by 2050 the carbon emissions attributable to the ICT sector will rise to more than 30% of all emissions globally.

In their conclusions, researchers acknowledged an inherent contradiction of digitalization: while on the one hand, digital technology "can help mitigate climate change," but to do so it "must first cease contributing to it" (p. 1).

![Plot comparing the greenhouse gas emissions of the aviation industry with the ICT sector according to ACM's 2021 Technology Policy Council report (image published under a [CC0](https://creativecommons.org/share-your-work/public-domain/cc0/) public domain license).](images/sec1_acm-report.png)

ICT has revolutionized how we live, and it is often praised for bringing convenience and efficiency to our daily lives. Companies have leveraged digital technology for the efficient distribution of all sorts of consumer goods and [dematerializing](https://en.wikipedia.org/wiki/Dematerialization_(economics)) everyday products. Vehicles, including cars, scooters, and bicycles, are made readily available for rental through apps, eliminating the need for individuals to own them in order to use them. Video streaming means not having to produce and transport DVDs or Blu-ray discs, and driving to the rental store to pick one up on a Saturday night is a thing of the past. E-readers have replaced entire bookshelves. Over the first two decades of the 21<sup>st</sup> century&mdash;with the global SARS-CoV-2 pandemic making digitalization an integral aspect of daily life&mdash;video conferences have been able to supplant once in-person activities for just about *everything*, including office meetings, five o'clock drinks, global academic conferences, local piano recitals, and even first dates ... now possible from the comfort of one's home.

For all the ways that technological developments have seemingly made our lives less material and wasteful, and thus more convenient and efficient, it might seem like the rapid pace of digitalization has done more good than harm when it comes to achieving sustainability goals.

But has it really?

The Internet and the devices we use to connect to it require infrastructure&mdash;real, physical hardware which demand energy and consume resources. Oft overlooked are the environmental impacts of the factories that produce these devices, the mines for rare earth metals necessary to make them work, and the continent-spanning cables connecting our world. All of this infrastructure requires energy in its day-to-day use. What's more, hardware that is no longer used either ends up in disposal centers for end-of-life treatment (which uses even more energy), or as e-waste that is toxic to people and to the environment. There is a hard material aspect of digitalization.

Within this broader picture, the critical role that *software* plays in contributing to this environmental harm may be overlooked. Indeed, in many cases it is the software that determines both the resources and energy consumed in the operating life of digital infrastructure. As the Blue Angel award criteria for the eco-certification of desktop software states:

> A fact that is even more rarely appreciated is that the key to increasing energy efficiency and protecting natural resources lies not with the hardware but rather above all with the software. (p. 5)

This handbook will take a closer look at some of the ways digital technology is contributing to environmental harm and the climate crisis. To be clear, this handbook is not anti-technology&mdash;indeed, digitalization has improved life in countless ways for vast numbers of people. But the ecological impacts of digital technology require us to think more deeply about the ways that we use it and how we might use it more efficiently. And the good news is that through software design, developers can have an immediate, and significant, influence on many of the issues discussed here.

Throughout the text, and especially in the later parts of this text, I will use the Blue Angel ecolabel for desktop software as a benchmark for what a sustainable digital society might look like.

But what is "Blue Angel", anyway?

The Blue Angel (German: *Blauer Engel*) environmental label is the official environmental label of the German government. In 2020, the German Environment Agency (German: *Umweltbundesamt*, or UBA) released the award criteria for certifying desktop software products. It was the first in the world of environmental certifications to link transparency and user autonomy with sustainability. Free and Open Source Software, or FOSS, has a real advantage here&mdash;and by the end of this manual, we hope you'll have a better understanding why. 

But in order to address a problem effectively, we first have to identify what the problem is. So let's first understand some of the harm that digitalization is doing.

## "Material Footprint Of Digital Technology"

Digital technology is often (erroneously) associated with being immaterial. But there is a very real and very material aspect to digitalization: this includes not only physical devices such as smartphones and laptops, but also processing plants for mined metals and ships transporting hardware, as well as cables and data centers connecting the world. The report ["Lean ICT: Towards Digital Sobriety"](https://theshiftproject.org/wp-content/uploads/2019/03/Lean-ICT-Report_The-Shift-Project_2019.pdf) from the SHIFT Project describes this issue succinctly:

> [T]he material footprint of digital technology is largely underestimated by its users, given the miniaturization of equipment and the "invisibility" of the infrastructures used. This phenomenon is reinforced by the widespread availability of services on the "Cloud," which makes the physical reality of uses all the more imperceptible and leads to underestimating the direct environmental impacts of digital technology. (p. 10)

To bring the tangible reality of the "cloud" back down to earth&mdash;underwater, even&mdash;we need to shift our perspective to the hidden infrastructure that provides the basis for our digital lives. One New York Times [article](https://www.nytimes.com/interactive/2019/03/10/technology/internet-cables-oceans.html) quipped: "[P]eople think that data is in the cloud, but it's not. It's in the ocean." What's referred to here are the global, underseas communication cables spanning the globe. However, although data transfer itself may be happening underwater, the ICT sector's carbon emissions are entering the atmosphere at an alarming rate. At COP27 in November 2022, United Nations Secretary General António Guterres [underscored the urgency of the moment](https://www.reuters.com/business/cop/sustainable-switch-cop27-warned-we-are-highway-climate-hell-2022-11-07/) when he stated: "We are on a highway to climate hell with our foot on the accelerator." Within the ICT sector, what is contributing to this atmospheric rise of CO<sub>2</sub>?

![World map of submarine communication cables (cable data by Greg Mahlknecht, KML file released under [GPLv3](https://www.gnu.org/licenses/gpl-3.0.html); world map by Openstreetmap contributors).](images/sec1_submarine_cable_map.png)

The ACM policy report mentioned in the introduction states that between 2012 and 2018, the energy demands of artificial intelligence (AI) has increased 300,000 times, and currently doubles every few months. To illustrate this, training a single AI model, such as a model used in machine translation and language modeling, required the energy equivalent of flying from New York to San Francisco round-trip … [300 times](https://doi.org/10.48550/arXiv.1906.02243) (or about 626,000 pounds of CO<sub>2</sub>)! In fact, according to the ACM report, data centers currently consume about 3% of the global eletricity supply. Another notorious contributor to exploding energy consumption is blockchain technology&mdash;in particular, proof of work systems such as [Bitcoin](https://www.nytimes.com/interactive/2021/09/03/climate/bitcoin-carbon-footprint-electricity.html), which [Harvard Business Review reports](https://hbr.org/2021/05/how-much-energy-does-bitcoin-actually-consume) requires as much energy as entire countries like Sweden or Malaysia.

Furthermore, the number of internet-connected devices&mdash;not only laptops and smartphones, but also smart TVs, home assistants, and other IoT devices&mdash;is rapidly growing. By 2025, the number is [expected](https://www.statista.com/statistics/471264/iot-number-of-connected-devices-worldwide/) to surpass 75 billion, or just about 10 devices for every person on earth. (The global distribution is far from even, though.) Manufacturing and discarding these devices is causing serious environmental harm, while the production and transportation of devices, as well as their usage, demand energy. Smartphone adoption in particular is increasing rapidly, as are the resource demands to [manufacture new, increasingly powerful devices](https://www.oekom.de/buch/smarte-gruene-welt-9783962380205). These are just some of the big contributors to the material footprint of digitalization.

A [report](https://theshiftproject.org/wp-content/uploads/2019/03/Lean-ICT-Report_The-Shift-Project_2019.pdf) from the Shift Project, a French nonprofit aimed at transitioning away from fossil fuels, provides a big-picture view of digital technology's energy consumption distribution. In "Lean IT&mdash;Towards Digital Sobriety" published in 2018, 55% of the energy consumption is attributed to device usage (e.g., personal computers, mobile phones, TVs and home entertainment systems, referred to as "terminals") along with network traffic and data center computing (*right*), whereas 45% of energy consumption can be attributed to hardware production (*left*). 

![Energy consumption distribution according to the Shift Project report (Image published under a [CC0](https://creativecommons.org/share-your-work/public-domain/cc0/) public domain license).](images/sec1_distribution.png)

It is crucial to underscore, however, that energy consumption is not the same as carbon emissions. Carbon emissions depend on the particular mix of fuels used for generating electricity in a particular region, referred to as the [electricity or power generation mix](https://www.planete-energies.com/en/medias/close/what-power-generation-mix). As an example, for the [European Union's energy supply](www.bpb.de/nachschlagen/zahlen-und-fakten/europa/75140/themengrafik-energiemix-nach-staaten) in 2016, the power generation mix included 32.9% oil, 23.9% gas, 14.9% coal, 13.7% nuclear power, and 14.5% renewables. With the energy crisis of 2022, the energy mix in the EU has changed&mdash;in some cases for the [better in the long-term](https://www.dw.com/en/energy-crisis-france-bets-on-floating-offshore-wind-energy/a-63831932), in some for the [worse in the short-term](https://www.dw.com/en/germanys-energy-u-turn-coal-instead-of-gas/a-62709160). Relative carbon emissions will depend on this mix: for example, energy consumption from 100% carbon-neutral energy sources contribute no direct CO<sub>2</sub> emissions.

In comparison to the comprehensive ACM report, the data in "LEAN IT" is more limited in scope[^1]&mdash;and the data was [collected in 2017](https://doi.org/10.3390/challe6010117), before a global pandemic changed many habits in our digital lives. Nevertheless, we'll soon explore show how software plays an overlooked but highly significant role in contributing to those numbers … and perhaps most surpisingly, both in terms of production and usage! First, though, let's go to the place where our digital devices will ultimately land after software has stopped running on them: in the waste bin.

[^1]: The production data does not include numbers related to transportation nor end of life treatment of devices. Moreover, devices such as printers and similar multi-function devices, digital and video cameras, music players and similar digital media, smart thermostats, personal drones, robots, driverless automotives, power banks, and so on, are not accounted for here. The authors explain that "while the excluded categories are not currently a significant contributor to electricity usage, compared to the ones included, some of them and others might emerge over the coming decade" (Andrae & Edler 2015: pp. 118&ndash;9). Finally, cryptocurrencies are not included in this analysis.

## A "Tsunami Of E-Waste": Dispatch From The Landfill

The Waste Electrical and Electronic Equipment Directive (WEEE Directive) is a European directive on waste electrical and electronic equipment. This Directive sets collection, recycling, and recovery targets for all types of electrical goods. In 2005, two years after the Directive became European law, the Royal Society of Arts in the UK unveiled a sculpture titled "WEEE Man", designed by Paul Bonomini and fabricated by Stage One Creative Services. Originally located on London's South Bank, the statue is made from 3.3 metric tons of electrical waste&mdash;the average amount of e-waste that one UK individual creates in a lifetime. The towering figure was subsequently moved to the Eden Project in Cornwall, where it currently resides.

![Photograph of WEEE Man statue by James T.M. Towill ([image published](https://www.geograph.org.uk/photo/2637892) under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/) license).](images/sec1_geograph-2637892-by-James-T-M-Towill_1600x1200.jpg)

At seven meter's tall, the "WEEE Man" is a giant. E-waste is [considered](https://www.weforum.org/reports/a-new-circular-vision-for-electronics-time-for-a-global-reboot/) the "fastest-growing waste stream in the world," with 44.7 million metric tons generated in 2016&mdash;[equivalent to](https://www.itu.int/en/ITU-D/Climate-Change/Documents/GEM%202017/Global-E-waste%20Monitor%202017%20.pdf) 4,500 Eiffel towers, which stacked would be almost 17 times higher than Mount Everest, the tallest mountain in the world. In 2018, an estimated 50 million metric tons of e-waste was reported, motivating the UN to [refer to](https://news.un.org/en/story/2015/05/497772) a "tsunami of e-waste rolling out over the world." The numbers continue to rise: in 2021, an [estimated](https://www.bbc.com/news/science-environment-61350996) 57 million metric tons of e-waste was generated globally. [Less than 20 percent](https://weee-forum.org/ws_news/international-e-waste-day-2021/) of it is collected and recycled, and although it [makes up](https://www.forbes.com/sites/vianneyvaute/2019/04/23/with-love-from-an-oregon-prison-how-eric-lundgren-is-going-to-help-you-recycle-all-your-electronics/) only 2% of trash in landfills, it contributes to almost 70% of the toxic waste found there.

![A young man is pictured burning electrical wires to recover copper at Agbogbloshie, Ghana, as another metal scrap worker arrives with more wires to be burned (image by Muntaka Chasant, published under a [CC BY-SA 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/deed.en) license).](images/sec1_800px-Agbogbloshie_Ghana_September_2019.jpg)

Electronic scrap components like CPUs contain potentially harmful materials such as lead, cadmium, beryllium, or brominated flame retardants. The end of life treatment of e-waste can also involve [significant risk to the health of workers and their communities](https://www.nytimes.com/2019/12/08/world/asia/e-waste-thailand-southeast-asia.html). What's more, [scavengers risk their health](https://www.nytimes.com/2019/05/12/climate/electronic-marvels-turn-into-dangerous-trash-in-east-africa.html) for the discarded precious metals in laptops and smartphones "[laced with lead, mercury or other toxic substances](https://www.nytimes.com/2018/07/05/magazine/e-waste-offers-an-economic-opportunity-as-well-as-toxicity.html)". The process of dismantling and disposing of e-waste has led to a number of environmental impacts in developing countries. Liquid and atmospheric emissions end up in bodies of water, groundwater, soil, and air&mdash;and thus, also in land and sea animals, in crops eaten by both animals and humans, and in our drinking water. Environmental pollution is a crucial aspect of digital technology's environmental harm.

## When Less Is Not More: Relative Harm In Production Costs

It's tempting to assume that with digital technology less is indeed more. Digitalization is often associated with "dematerialization": printing concert or travel tickets on paper is no longer necessary, as they can be simply be downloaded and presented on one's smartphone; entire bookshelves can been replaced by a single e-reader; photographs are not collected in over-stuffed shoeboxes, but on a tablet or hard drive; thousands of films and TV series are streamed on laptops, making movie collections a thing of the past. In many cases, one device, a smartphone, is used for all of the above&mdash;and much, much more.

All of those material objects which were once a major part of our daily lives&mdash;but today, they are simply no longer needed. That must be better for the earth, no?

When estimating the potential ecological benefits of digitalization, however, it is necessary to account for the entire life cycle of an item, including the costs of their production and transportation (to and from the shop, as well as the landfill), or the costs of remediating environmental harm from e-waste. This is especially true when considering digitalization's carbon footprint, since in most cases the production of devices, together with their transportation and end of life treatment, contribute more greenhouse gas emissions than the devices' use over their *entire* operating life. To illustrate this, consider Apple's 2019 [Environmental Responsibility Report](https://www.apple.com/environment/pdf/Apple_Environmental_Responsibility_Report_2019.pdf), which estimates that Apple contributed 25.2 million metric tons of CO<sub>2</sub> in 2018 (p. 9): most of this&mdash;eighty percent(!)&mdash;comes from production (74%), transportation (5%) and end-of-life treatment (<1%); only 19% comes from the actual usage of devices.

So when are the costs of manufacturing a digital device to replace all of those analogue objects worth it? The book ["Smarte Grüne Welt"](https://www.oekom.de/buch/smarte-gruene-welt-9783962380205) (English: *Smart Green World*) by Steffen Lange and Tilman Santarius (2018) explores the difficulty of accounting for relative environmental harm when trying to answer such questions. Consider this excerpt, in which the authors explore the environmental impact of printing paper books vs. manufacturing e-readers (pp. 29&ndash;31; unofficial translation):

> Making electronic devices is obviously more energy-intensive and resource-intensive than printing a single book. For example, the production of an e-reader, usually weighing less than 200 grams, accounts for about 15 kilograms of different materials (especially non-renewable metals and rare earths), 300 liters of water, and 170 kilograms of the greenhouse gas carbon dioxide. However, it is not just the quantities of input and output materials that are decisive, but also their environmental impact. There are great differences between e-readers and books, especially in the toxicity of materials and manufacturing processes. It is true that the paper industry in many countries (still) has very negative environmental effects, for example when chlorine or acids poison local waters. However, the environmental effects of the electronics industry are sometimes devastating: e-readers and other IT products include brominated fire retardants, phthalates, beryllium, and numerous other chemical substances that are severely harmful to health and the environment. Not to mention the social consequences, such as the sometimes miserable working conditions under which cobalt, palladium, tantalum, and other resources of digital devices are initially extracted in dictatorships such as the Republic of Congo or in other countries of the global South%mdash;and then disposed of there at the end of life as environmentally-harmful e-waste.
>
>Despite all of this, the e-reader may be better than the book. This ultimately depends on two factors: How many books are read on the e-reader over its lifetime&mdash;and how many people share an analog book? In order for the high environmental costs of the e-reader’s production to pay off ecologically, a certain number of books must be read on it. This is the case after 30 to 60 books&mdash;depending on the thickness of the book and depending on the environmental indicator. If you read less than this number of books on an e-reader, it is better to choose the paper form. If you go beyond this, each other book on the e-reader is ecologically better than its analog counterpart. Furthermore, how objects are used is crucial […]: If it is assumed that someone buys a book and does not let anyone else look at it, then a file on the e-reader is around five times more energy-efficient than a book. This advantage, however, disappears when several people share a book.

So, does replacing physical objects with digital technology result in a reduced environmental impact? Well, it depends. For the case of e-readers, will you read 30&ndash;60 books before discarding the device? A [Gallup poll](https://news.gallup.com/poll/388541/americans-reading-fewer-books-past.aspx) found that in 2021, 57% of US Americans read fewer than 5 books a year, and 15% read between 6-10 books. This means for over two-thirds of the US population, an e-reader would need to be used for five to ten years in order to be the more environmentally friendly choice. But how many consumers upgrade to the next, shiny new device well before then?

Moreover, will these devices remain supported for up to five years, let alone a decade? Wikipedia's [list of discontinued e-readers](https://en.wikipedia.org/wiki/Comparison_of_e-readers#Discontinued_models), as of November 2022, includes seventy-one devices. According to the list, the average lifespan&mdash;from intro year to end year&mdash;was 1.5 years. How many of those e-readers were still functioning, but ended up in a landfill because of discontinued software support? This kind of premature hardware obsolescence is an important contributor to environmental harm, whether in the form of e-waste or the carbon emissions associated with the device. As Lange and Santarius write, "it is questionable whether all e-readers sold, before they break or become technically obsolete again, are used so intensively on average that an overall ecological benefit is achieved" (p. 31; unofficial translation).

## Look To The Software

There is a crucial relationship between software engineering&mdash;sometimes following a logic unrelated to the primary functionality of the software itself&mdash;and sustainability issues. Manufacturers regularly encourage consumers to purchase new devices, often unnecessarily; indeed, they may even enforce it through software design. And because of licensing restrictions on software use and certain forms of vendor dependencies, end users can do little about it.

[Programmed obsolescence](https://en.wikipedia.org/wiki/Planned_obsolescence#Programmed_obsolescence) and [software lock-out](https://en.wikipedia.org/wiki/Planned_obsolescence#Software_lock-out) result in discontinued hardware support for largely economic, not technological reasons; [abandonware](https://en.wikipedia.org/wiki/Abandonware) released under a [proprietary license](https://en.wikipedia.org/wiki/Software_licensing#Proprietary_software_licenses) can leave users vulnerable to viruses and other malware&mdash;and without alternatives to keep their device safely in use. Underlying infrastructure which users are depending on to run an application&mdash;such as [software license servers](https://en.wikipedia.org/wiki/Software_license_server) used for access control by software vendors&mdash;can go offline, sometimes permanently. [Feature creep](https://en.wikipedia.org/wiki/Feature_creep) and other forms of [software bloat](https://en.wikipedia.org/wiki/Software_bloat) may render less-powerful hardware obsolete, although users never requested those extra functionalities and would remove them if they could. In these cases, due to software-related dependencies and usage restrictions, still-functioning devices are tossed in the garbage heap while resources are consumed to produce and transport new ones.

Indeed, software bloat is one of several issues the Blue Angel ecolabel identifies as being problematic. Bloat is described in the [award criteria for desktop software](https://produktinfo.blauer-engel.de/uploads/criteriafile/en/DE-UZ%20215-202001-en-Criteria-2020-02-13.pdf) like so (p. 5):

> Processing power has doubled about every two years since 1970. This means that functions are processed twice as fast and thus less energy is required for the same functions. A similar improvement in efficiency cannot be observed in the field of software. […] The availability of more and more powerful hardware has resulted in software becoming more and more bloated from version to version so that more resources are required **for only minimal or even no enhancement of the functionality**. [emphasis added]

Besides rendering functioning devices unusuable, software bloat also results in higher energy consumption when using the software. For example, [one study](https://www.umweltbundesamt.de/publikationen/entwicklung-anwendung-von-bewertungsgrundlagen-fuer) published by the German Environment Agency found that two applications which achieve the same result can have drastically different energy profiles.

![Bar plot comparing two word processors during execution of a Standard Usage Scenario (based on Figure 1 on page 24 in the report). Word Processor 1 is an Open Source program. This word processor consumes four times *less* energy than Word Processor 2, a proprietary program. (Image published under a [CC0](https://creativecommons.org/share-your-work/public-domain/cc0/) public domain license.)](images/sec1_uba-sus.png)

In the report Word Processor 1 is identified as Open Source and Word Processor 2 as a proprietary software product. It is important to underscore that both computer programs were running the same sequence of commands through a Standard Usage Scenario (SUS) script. These scripts describe "the most representative use of the respective software over a defined period of time" (p. 23). We'll return to usage scenarios in Part II of this handbook. For now, what's important to note is the massive difference in energy use: running Word Processor 2 requires 4 times the energy consumption of Word Processor 1&mdash;again, and this cannot be stressed enough, to achieve the same result! 

Further, when looking at the energy consumption of the two word processors over time, it becomes clear how the two software products behave very differently … and perhaps contrary to expectations. Consider the energy consumption in the plot below, in which the energy consumed over time is shown while running the usage scenario's sequence of commands. At the 440-second mark, the script calls for both word processors to save the document and then stops calling for further action. As you can see, Word Processor 1 goes idle (as one might expect); by contrast, Word Processor 2 continues working, consuming energy even though the script has ended.

![Plot comparing two word processors over time when running a Standard Usage Scenario (SUS). Word processor 1 (*top*) goes into an idle state when not doing anything, seen most clearly after the document is saved at the 440-second mark and no other actions are emulated by the SUS script. By comparison, word processor 2 (*bottom*) rarely goes idle. (Screenshot from article published under [CC BY-NC-ND](http://creativecommons.org/licenses/by-nc-nd/4.0/) license.)](images/sec1_energy-consumption_time.png)

It's worth asking what the additional energy consumption from 440&ndash;600 milliseconds is for: Are the actions of Word Processor 2 necessary for the functionality of the software? Is the word processor collecting and transmitting user data? If yes, do users have a way to opt out of these types of analytics? Indeed, user autonomy in turning off of unwanted data use can make a big difference on the energy profile of a software product. Data mining, third-party tracking, personalized engagement-maximizing algorithms, and advertising are significant drivers of energy consumption. Collecting and analyzing user data and training algorithms on it also requires computing power and infrastructure!

In 2021, researchers in the EU estimated the environmental costs of tracking which users cannot opt out of, what they refer to as "unwanted data use" (["Carbon footprint of unwanted data-use by smartphones: An analysis for the EU"](https://groenlinks.nl/sites/groenlinks/files/2021-09/CE_Delft_210166_Carbon_footprint_unwanted_data-use_smartphones.pdf)). The carbon footprint of this tracking and advertisements by smartphones&mdash;between 3 and 8 million metric tons a year in the EU alone&mdash;is "equal to the carbon footprint of between 370 and 950 thousand EU citizens" (p. 12). This is roughly the [annual footprint of a city](https://doi.org/10.1088/1748-9326/aac72a) like Turin, Italy or Lisbon, Portugal. The report also points out that about 60% of European smartphone users indicate they would opt out of tracking and block advertisements when possible. That's an awful lot of energy use for something most users don't want in the first place!

In many ways, digital sustainability is a question of software. Software determines how long devices remain in use as well as the energy consumed during use. It is for this reason that the Blue Angel award criteria look to the characteristics of software design which have a clear impact on health and the environment, which we will return to shortly. Beforehand, though, we will consider two side topics relevant to the discussion here.

### "The Very Contrary Is The Truth": Jevons' Paradox

The "rebound effect" (also known as the "take-back effect") describes how efficiency gains can decrease or even negate efficiency benefits. Imagine that a change in software results in a 5% improvement in energy efficiency; however, because of the increased energy savings, you end up using the software more. But as a result of increased usage, you now have less savings.

For the sake of concreteness, imagine that&mdash;because you are using the software more&mdash;instead of 5% drop there is only a 1% drop in overall energy consumption. The [rebound effect](https://energyskeptic.com/2014/jevons-paradox-the-rebound-effect/) is 80% ((5-1)/5): in other words, those original efficiency gains have decreased by 80%, practically negating any savings from the improved efficiency! If the rebound effect goes over 100%, meaning more energy is now used than before, this is referred to as [Jevons' Paradox](http://en.wikipedia.org/wiki/Jevons_paradox), or "back-fire." The paradox comes from the English economist William Stanley Jevons, who in 1865 recognized that technological improvements in coal-use actually increased coal consumption across industries. Jevons concluded that:

> "It is a confusion of ideas to suppose that the **economical use of fuel is equivalent to diminished consumption**. The very contrary is the truth." [emphasis added]

A practical interpretation of this paradox is that efficiency gains must be combined with conservation practices in order to have a meaningful effect, lest one ends up consuming more energy than before. That ACM report&mdash;the same one referenced at the beginning of this handbook&mdash;makes a similar point: "Computing-enabled efficiencies must be coupled with slashed energy demand to reduce ICT sector carbon emissions." (p. 1) 

### Is This Worth It? 

Looking at the bigger picture, software's contribution to environmental harm and global greenhouse gas emissions may be less significant in comparison to other industries. To this point, let us consider four counter-arguments. The first is rejecting the ["not as bad as"](https://rationalwiki.org/wiki/Not_as_bad_as) fallacy, also known as the "Appeal to Worse Problems". The argument can be summed so: software's contributions to global CO<sub>2</sub> emissions may not be as bad as another industry's, and therefore it is not worth focusing on. What is wrong with this argument is, even if another industry may be worse, that does not negate the fact that software is responsible for causing serious environmental harm. What's more, we can reduce software's environmental impact AND reduce another industry's at the same time: the "not as bad as" fallacy suggests a false choice.

Let's not [be like XKCD's](https://www.explainxkcd.com/wiki/index.php/2368:_Bigger_Problem) White Hat and appeal to worse problems as an excuse not to do anything:

![XKCD comic ["2368: Bigger Problem"](https://xkcd.com/2368/) (comic released under [CC BY-NC 2.5](https://creativecommons.org/licenses/by-nc/2.5/) license).](images/sec1_bigger_problem.png)

Second, focusing only on fixing the "biggest problem" is not necessarily the most effective strategy&mdash;it's also important to weigh the likelihood of success when addressing a problem, as well as the time and resources required to do so. Free & Open Source Software, with its focus on user autonomy and transparency, provides unique opportunities for users, communities, and organizations to directly address intertwined social and ecological issues. FOSS can be adapted, updated, and maintained at lower cost and without vendor dependencies or artifical restrictions.

Third, it's hopefully clear by now that software *does* have significant impacts on energy consumption and the production of waste, both of which have consequences for the environment. When considered at scale, changes in software design can have savings comparable to the annual energy consumption of entire cities. For instance, [watch Detlef Thoms](https://open.hpi.de/courses/cleanit2021/items/5DHsS3tJsXAqfUE4q4F82Z) (04:20&ndash;06:10 do back-of-the-envelope calculations to go from one CPU-second reduction, equivalent to about a 10 watt-second savings, to 95,000 megawatt hour savings simply by scaling up&mdash;this is roughly the annual energy consumption of over 30,000 two-person households. As he states in the video, "often, it is a quite manageable set of decisions which lead to significant differences in power consumption".

Finally, in order to make claims about relative harm, it is necessary to first have estimates about actual effects. Since research in the area of software's energy and resource consumption is still quite new, we often do not have data to make data-driven claims. With this handbook, and with the Blue Angel ecolabel as a guide, KDE hopes to help change that.

Changing our software may seem like a small gesture in addressing as complex as climate change. It's also clear that simply changing our individual consumption patterns may not be sufficient on its own (what's worse, [evidence](https://doi.org/10.1016/j.oneear.2021.04.014) suggests that major contributors to global greenhouse gas emissions&mdash;such as ExxonMobile&mdash;have embraced a rhetoric of individual responsibility in order to deflect from their own role in the crisis).

It's true: a zero-emissions future will require fundamental shifts in how we live, and that responsibility can't be managed at an individual level. But consider what anthropologist Margaret Mead once observed:

> "Never doubt that a small group of thoughtful, committed citizens can change the world; indeed, it’s the only thing that ever has."

Structural change happens when dedicated, passionate people organize to confront pressing societal issues. With decades of experience successfully bringing global communities together to work toward common goals, Free & Open Source Software is very well positioned. We know how to organize&mdash;now, it's a matter of doing it. Let's unite to combat software-driven environmental harm. Let's foster a culture of digital sustainability in our software communities. Let's build energy and resource efficient software together!

## Part I Sources

Some material in this section is based directly on text from two Wikipedia articles: (i) "<a href="https://en.wikipedia.org/wiki/Waste_Electrical_and_Electronic_Equipment_Directive">Waste Electrical and Electronic Equipment Directive</a>" and (ii) "<a href="https://en.wikipedia.org/wiki/Electronic_Waste">Electronic waste</a>." Both texts are released under the <a href="https://invent.kde.org/teams/eco/be4foss/-/blob/master/LICENSES/CC-BY-SA-3.0.txt">Creative Commons Attribution-Share-Alike License 3.0</a>.

# PART II: Eco-Certifying Desktop Software

![Okular, KDE’s popular multi-platform PDF reader and universal document viewer, was awarded the Blue Angel ecolabel in March 2022 (image published under a [CC-BY-4.0](https://spdx.org/licenses/CC-BY-4.0.html) license).](images/sec2_okular-BE-logo.png)

What do construction products, toilet paper, and software have in common?

Each of these  can be eco-certified by the Blue Angel environmental label&mdash;the official environmental label of the German government!

The Blue Angel ecolabel is awarded to a range of products and services, from paper products and construction materials to printers, and certifies that the product meets a list of stringent requirements for being environmentally friendly over a product's life cycle. In 2020, the German Environment Agency (UBA) extended the award criteria to include software products, which was the first environmental certification in the world to link transparency and user autonomy with sustainability.

Specifically, eco-certification requires being transparent about the energy consumption when using the software, and ensuring that the software is capable of running on older hardware. Moreover, the criteria also include a list of requirements related to user autonomy which reduce the environmental impact of software.

![The three steps to eco-certification: Measure, Analyze, Certify (image from Karanjot Singh published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license).](images/sec2_3StepsToBEECO.png)

This manual will provide a broad overview of the Blue Angel and the ABCs of the award criteria for desktop software. It will also demonstrate how meeting the award criteria can reduce environmental harm&mdash;and hopefully motivate you and your team to eco-certify your software project, too! Here, there will be a focus on the user autonomy requirements of the Blue Angel award criteria, which we will return to in Part III. But first, a brief introduction to the Blue Angel and the KDE Eco initiative. 

## The Blue Angel

Introduced in 1978, the Blue Angel is the oldest ecolabel in the world and the official environmental label awarded by the German government. The label is adminstered by Germany's Federal Ministry for the Environment, Nature Conservation, Nuclear Safety, and Consumer Protection (German: *Bundesministerium für Umwelt, Naturschutz, nukleare Sicherheit und Verbraucherschutz*, or BMUV). The Blue Angel ecolabel is also a member of the [Global Ecolabelling Network (GEN)](https://globalecolabelling.net/), an international network of Type I ecolabels which [at the time of writing](https://web.archive.org/web/20221026003053/https://globalecolabelling.net/) has 37 members across nearly 60 countries. 

![Logo of the Blue Angel ecolabel. The logo is intentionally designed to correspond to the logo of the United Nations Environment Programme. This reflects the aim of the German government to embed the UNEP goals in Germany. (Image published under a [CC-BY-SA-4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.de) license.)](images/sec2_blauer-engel-logo.png)

The Blue Angel was not the first Type I ecolabel for software&mdash;the Hong Kong Green Council, also a member of the Global Ecolabelling Network, released [criteria in 2010](https://greencouncil.net/hkgls/GL006004_rev0.pdf) for Green IT software. But the Blue Angel ecolabel criteria are the first to identify a process for measuring software's energy consumption, and the first to specify ways that user independence reduces environmental harm. 

'What is a Type I environmental label?', you may be wondering. For Type I labels, the entire life cycle of the product is taken into account, and compliance with the award criteria is assessed by a third-party (compliance with Type II environmental labels, on the other hand, are self-declared and do not require any third-party auditing.) 

The Blue Angel ecolabel is currently awarded to around 100 product groups and services across a variety of sectors, including paper products, building products, furnishings, clothing, washing and cleaning agents, cleaning services, household chemicals, packaging, vehicles, energy and heating, and household electrical devices. As of 2022, with the eco-certification of KDE's popular PDF and universal document reader, that list also includes desktop software.

The award criteria for certification are developed transparently by the German Environment Agency (UBA), and the process includes the Environmental Label Jury, a body made up of suppliers as well as civil society organizations and research institutions. The independent auditor RAL gGmbH assesses compliance with the award criteria and awards the seal. Importantly, the Blue Angel does not certify that a product is completely harmless. Instead, certified products represent a "lesser evil" with respect to environmental harm&mdash;this can be summed up with the motto '*as little as possible, as much as necessary*'. Rather than compare different products, the Blue Angel ecolabel indicates that a product fulfills a list of requirements for a specific category.

## The ABCs Of The Award Criteria For Desktop Software

The Blue Angel's award criteria for ["Resource and Energy-Efficient Software Products"](https://www.blauer-engel.de/en/products/electric-devices/resources-and-energy-efficient-software-products) were released in January 2020. As stated in the criteria, there are two primary objectives of the Blue Angel for software: (i) to award software with lower performance requirements such that "longer operating lives for [...] hardware are possible"; and (ii) to recognize products which "stand out due to their high level of transparency and give users greater freedom in their use of the software" (p. 6). To achieve this, there are three main categories of the criteria, referred to here as the ABCs of the award criteria.

 - (A) Resource & Energy Efficiency

 - (B) Potential Hardware Operating Life

 - (C) User Autonomy

The criteria listed in category (A) not only requires that the energy consumption of a software product be measured and reported, but states that the energy consumption of the software canoot increase by more than 10% from the time of certification. Energy consumption data is measured using an external power meter, and other hardware performance information such as CPU usage, network traffic, etc., while running the software in a representative way.

The criteria in category (B) ensure that the software has low-enough performance requirements to run on older, less powerful hardware. Compliance entails a declaration of backward compatibility, with details about the hardware and the required software stack at least five years old on which the software runs.

Finally, the criteria in category (C) ensure that users have an influence on the energy consumption and resource-conserving use of their software. There are eight categories for the autonomy criteria: 

 1. Data Formats &mdash; *Interoperability To Give Users A Choice To Use Other, More Efficient Software*

    Data formats should not be used by vendors to [lock in](https://en.wikipedia.org/wiki/Vendor_lock-in) users to a specific computer program, nor should they impose onerous switching costs. [Interoperable](https://en.wikipedia.org/wiki/Interoperability) data formats prevent users from being stuck using a program that consumes a high amount of energy, when a more efficient one can achieve the same results. Users should also be able to easily change programs and still access all of their data.

 2. Transparency &mdash; *Being Open To Remove Dependencies, Essential For Long-Term Use*
 
    Transparency in software code and application interfaces removes dependencies on a particular company or organization as well as restrictions on the short and long-term use software. When developers decide to end support for their software, either continued security updates should be provided (see below) or the source code should be made publicly available so third parties can continue support for the software. Furthermore, enhancing the functionality of software must not be limited by restrictive or undocumented application interfaces (APIs). Indeed, issues related to application interfaces are so critical they even came before the United States Supreme Court in 2021, where there was a [favorable ruling for fair use](https://en.wikipedia.org/wiki/Oracle_America,_Inc._v._Google,_Inc.#Decision) of transparent interfaces.

 3. Continuity Of Support &mdash; *Security Updates To Prevent E-Waste*
 
    Dependency on suppliers for essential updates should not leave users with [abandonware](https://en.wikipedia.org/wiki/Abandonware), where the software (and thus, hardware) cannot be used without serious disadvantages such as vulnerabilities to [malware](https://en.wikipedia.org/wiki/Malware). Security updates should be provided for up to five years after discontinued development. Moreover, security updates should be separable from functional updates so users are not coerced into adopting unwanted functionalities from [feature creep](https://en.wikipedia.org/wiki/Feature_creep) and other forms of [software bloat](https://en.wikipedia.org/wiki/Software_bloat).

 4. Uninstallability &mdash; *Removing Unwanted Software To Increase Efficiency*

    Being able to completely uninstall software that is not needed has ecological benefits. Similar to software bloat and feature creep, unwanted software or software components can create inefficiencies by occupying memory, wasting processing time, adding disk usage, consuming storage, and causing delays at system startup and shutdown. When a user no longer wishes to continue using a software product, it must be possible to completely purge it from the system, while keeping all user-generated data.

 5. Offline Capability &mdash; *Removing Dependencies To Keep Software Usable Long-Term And Decrease Energy Consumption*
 
    Use of the software should be possible without an internet connection&mdash;unless, of course, a network connection is necessary for the software's intended functionality. License servers and other forms of access control restrict use of an application in ways unnecessary to the software's designed functionality. When a server goes down or there is Internet outage, such access control locks people out from using their software, [possibly permanently](https://en.wikipedia.org/wiki/Abandonware#Implications). Moreover, such dependencies use network traffic, and thus consume energy beyond that needed for the intended functionality of the software.

 6. Modularity &mdash; *Having Essential Functions Only To Decrease Memory And Energy Demands*

    Users should be able to install only what they need. Non-essential functions increase memory and energy demands, making the software less efficient and perhaps unable to run on older hardware. People should have the ability to limit the range of software functions to those that they either want or require.

 7. Freedom From Advertising &mdash; *Opting-Out To Reduce Energy Consumption*
 
    As discussed in Part I, unwanted data use in the European Union alone is roughly equivalent to the annual energy consumption of a city like Lisbon or Turin. Allowing users to opt out of advertizing reduces resource and energy demands on end-user devices as well as on the servers pushing the ads. Opting out also decreases data volume transmitted and thus energy consumption from network traffic.

 8. Documentation &mdash; *To Support Resource-Conserving, Continuous Use Of Software, And Therefore Hardware*
 
    Documentation is a prerequisite for long-term viability of a software product. Documentation is also necessary for the resource-conserving use of an application. By documenting the above criteria, users can continue using the software and thus hardware in a sustainable way and developers can continue to maintain the software without dependencies on or restrictions from vendors.

Software products that comply with the award criteria are less likely to suffer from bloat and other inefficiencies. This mitigates problems related to software-driven hardware obsolescence and can reduce e-waste, which in turn results in fewer devices needing to be produced and shipped, and valuable metals do not need to be mined and processed. By ensuring user autonomy, developers can make sure that the software they produce has a lighter environmental impact&mdash;whether through keeping devices in use for longer, or reducing their resource and energy consumption when in use. 

The Blue Angel award criteria for software, with its focus on transparency in resource and energy-efficiency, hardware operating life, and user autonomy, provide an excellent benchmark to begin a discussion on software sustainability and push development in this area forward. Moreover, in FOSS communities we often take user autonomy and transparency and their benefits for granted. Although being Free & Open Source Software is not a requirement to obtain the Blue Angel ecolabel, it is in this category that FOSS really shines&mdash;in so many ways, we are already at the forefront of sustainable software design!

## <a name="sec:okular"></a> First Eco-Certified Computer Program: KDE's Popular Document Reader Okular

[Okular](https://okular.kde.org/), KDE’s popular multi-platform PDF reader and universal document viewer, was the first software product to be officially recognized for sustainable software design as reflected in the Blue Angel award criteria. Introduced in 1978, the Blue Angel is the world’s earliest-established environmental label. In February 2022, Okular was the first-ever software product to be certified with its seal! What is more, Okular is the first eco-certified computer program within the Global Ecolabelling Network representing nearly 60 countries. 

In 2021, KDE started KDE Eco, a project with the goal of putting KDE and Free Software at the forefront of sustainable software design. Sustainability is not a new for Free & Open Source Software (FOSS)&mdash;the [four freedoms](https://fsfe.org/freesoftware/index.en.html) have always put Free Software at the forefront of sustainable software design. What is new is that the two pillars of FOSS, namely, transparency and user autonomy, are now directly linked to sustainability goals by an organization like the German Environment Agency (UBA).

![Logo of the KDE Eco initiative (image published under a [CC-BY-4.0](https://spdx.org/licenses/CC-BY-4.0.html) license).](images/sec2_kde-eco-logo-domain.png)

The Blue Angel award criteria reflect KDE’s values and those of the larger FOSS movement seamlessly. With Free & Open Source Software, transparency is guaranteed and control is handed over to users, instead of being held back by vendors or service providers. This allows users to decide what they want from the software they use and, all too often overlooked, the hardware as well. For instance, users may drive down the energy consumption of their programs with no loss in functionality as they can install only what they need, no more and no less; and avoid advertising and data-mining options which run processes in the background consuming resources. As for FOSS developers, they typically continue to support hardware that the industry would be eager to make obsolete, providing users with up-to-date and secure software for devices that might otherwise be discarded as e-waste and end up polluting landfills.

![Okular's energy consumption report.](images/sec2_okular-energy-consumption.png)

KDE was founded in 1996, and has become a world-wide community of software engineers, artists, writers, translators, and creators who are committed to Free Software development. KDE maintains numerous FOSS products, including the Plasma desktop environment; the design app for painters and graphic artists, Krita; the GCompris suite of educational activities for children; Kdenlive, a professional video-editing software product; and, of course, Okular, with which you can view all sorts of documents, including PDFs, comics, scientific and academic papers, and technical drawings. With KDE’s long-standing mission and guiding vision, as well as the talent and capabilities of its community members, it is not surprising that KDE is a pioneer in championing sustainable software. Now, with the first ever eco-certified software product, the KDE community is [celebrating the achievement](https://eco.kde.org/blog/2022-09-28_okular_blue-angel-award-ceremony/) together with the [wider](https://www.linux-magazin.de/news/pdf-reader-okular-erhaelt-blauen-engel/) [Free Software](https://fsfe.org/news/2022/news-20220316-01.de.html) [community](https://netzpolitik.org/2022/nachhaltigkeit-erste-software-mit-blauem-engel-ausgezeichnet), as well as with the computer science department at [Umwelt Campus Birkenfeld](https://www.umwelt-campus.de/en/forschung/projekte/green-software-engineering/news-details/first-blue-angel-for-software), where researchers measured the resource and energy-consumption of Okular and other KDE software.

Released under the GPLv2+ license, Okular is FOSS and so was also already fulfilling many of the user autonomy criteria necessary to obtain the Blue Angel seal of approval. Further work was carried out to make Okular fully compliant with all of the award criteria in order to become officially recognized as providing transparency in energy and resource consumption, extending the potential hardware operating life of devices, and enabling user autonomy.

![Icon for KDE's popular application Okular (image published under a [???]() license).](images/sec2_okular.png)

Okular works on Linux, Windows, Android, and Plasma Mobile, and is available to download for all GNU/Linux distributions, as a standalone package from Flathub and the Snap Store, through the KDE F-Droid release repository for Android, as well as from the Microsoft Store. Okular also lets you check digital signatures and sign documents yourself, as well as include annotated text and comments directly embedded into the document.Being FOSS, the source code is also readily available at Okular’s GitLab repository for all to use, study, share, improve, and most of all, enjoy.

KDE and the Free Software community would like to send a heartfelt thank you to the Okular developers for making environmentally-friendly software for all of us! In the next section we will look at the steps you need to do to join us in having your software project recognized for sustainable software design.

## Part II Sources

Some material in this section is based directly on the following three texts:

 - The Wikipedia article <a href="https://en.wikipedia.org/wiki/Blue_Angel_(certification)">"Blue Angel (certification)"</a>, which is released under the <a href="https://invent.kde.org/teams/eco/be4foss/-/blob/master/LICENSES/CC-BY-SA-3.0.txt">Creative Commons Attribution-Share-Alike License 3.0</a>.
 
 - The Wikipedia article "<a href="https://en.wikipedia.org/wiki/Software_bloat">Software bloat</a>", which is released under the <a href="https://invent.kde.org/teams/eco/be4foss/-/blob/master/LICENSES/CC-BY-SA-3.0.txt">Creative Commons Attribution-Share-Alike License 3.0</a>.

 - The KDE Eco blog post <a href="https://eco.kde.org/blog/2022-03-16-press-release-okular-blue-angel/">"First Ever Eco-Certified Computer Program: KDE's Popular PDF Reader Okular"</a>, which is released under the <a href="https://invent.kde.org/teams/eco/be4foss/-/blob/master/LICENSES/CC-BY-SA-4.0.txt">Creative Commons Attribution-Share-Alike License 4.0</a>.

# PART III: Fulfilling The Blue Angel Award Criteria

![Monitoring energy and hardware consumption in real time with KDE's LabPlot (image published under a [CC-BY-NC-ND-4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/) license).](images/sec3_labplot_live-measurement.png)

The three main categories of the Blue Angel award criteria for desktop software are:

 - (A) Resource & Energy Efficiency

 - (B) Potential Hardware Operating Life

 - (C) User Autonomy

In this section I'll cover the three categories in more depth, providing a hands-on guide to fulfilling each set of criteria. There are numerous benefits of going through the certification process. By making the energy consumption of your software transparent and complying with the hardware operating life and user autonomy criteria, you get the benefits of:

 - **Eco-Certification**: Apply for the Blue Angel ecolabel to demonstrate to users, companies, and governmental organizations that your software is designed sustainably.

 - **Data-Driven Development**: Locate areas of inefficiencies in terms of energy consumption, and make data-driven decisions for your software development.

 - **Sustainable Software Design**: Take user autonomy criteria into consideration when planning your software design.
 
 - **Providing End-User Information**: Highlight to your users the ways your software is already sustainably designed by using the Blue Angel criteria as a benchmark.

## (A) How To Measure Your Software

The lab setup consists of a power meter, a computer to aggregate and evaluate the power meter output, and a desktop computer for the system under test where user behavior is emulated. The setup described here follows the specifications from the [Blue Angel Basic Award Criteria for Resource and Energy-Efficient Software Products](https://produktinfo.blauer-engel.de/uploads/criteriafile/en/DE-UZ%20215-202001-en-Criteria-2020-02-13.pdf). Terminology comes in part from Kern et al. (2018): ["Sustainable software products &mdash; Towards assessment criteria for resource and energy efficiency"](https://doi.org/10.1016/j.future.2018.02.044).

### Overview Of Lab Setup

The laboratory setup requires 1 power meter and at least 2 computers:

 - *Power Meter*

    One of the devices recommended by the Blue Angel is the [Gude Expert Power Control 1202 Series](https://www.gude.info/en/power-distribution/switched-metered-pdu/expert-power-control-1202-series.html) ([manual](https://gude-systems.com/app/uploads/2022/05/manual-epc1202-series.pdf)). It provides plugs for powering the computer and measures the current during operation. The device can be controlled and read via cabled Ethernet. There is a web-based user interface, a [REST API](http://wiki.gude.info/EPC_HTTP_Interface), and the device supports various protocols such as SNMP or syslog.

 - *Computer 1: Data Aggregator & Evaluator*

    The computer for collecting and evaluating results from the power meter.

    A Python script to read out the data from the Gude Expert Power Control 1202 Series is available at the [FEEP repository](https://invent.kde.org/teams/eco/feep/-/tree/master/tools/GUDEPowerMeter).
    
    It is recommended to monitor progress live with the second computer in order to ensure everything is proceeding smoothly. This can be done with KDE's [Labplot](https://apps.kde.org/labplot2/), for instance; see [here](#sec:labplot).

    Other power meters may require non-Free software, e.g., Janitza's [GridVis Power Grid Monitoring Software](https://www.gridvis.com/gridvis-overview.html).

![Gude Power Meter (image published under a [XXX]() license).](images/sec3_gude-pm.jpg)

  - *Computer 2: System Under Test*

    The reference system is the hardware used to measure the energy consumption of the system under test, or SUT. The SUT includes the operating system and software installed for (i) testing the software product, (ii) emulating the standard usage scenario[^2] and (iii) collecting the hardware performance results.

[^2]: It is also possible to have a setup using 3 computers, with the Standard Usage Scenario emulation generated on a computer independent of the SUT; see Kern et al. (2018). Details of a similar [setup for an external workload generator](https://invent.kde.org/teams/eco/feep/-/tree/master/tools/arduino-board_external-workload-generator.md) can be found at the FEEP repository.
 
Note the following:

For GNU/Linux systems, the [Blue Angel criteria (Section 1.1)](https://produktinfo.blauer-engel.de/uploads/criteriafile/en/DE-UZ%20215-202001-en-Criteria-2020-02-13.pdf) recommend Fujitsu computers as the reference system.

For emulating activity in the standard usage scenario, Free Software task automation tools such as [`xdotool`](https://github.com/jordansissel/xdotool), [`KDE Eco Tester` (in progress)](https://invent.kde.org/teams/eco/feep/-/tree/master/tools/KdeEcoTest), or [`Actiona`](https://wiki.actiona.tools/doku.php?id=en:start) (GPLv3) can be used.

For collecting hardware performance data (e.g., processor and RAM utilization, hard disk activity, network traffic), a Free Software tool such as [`Collectl`](https://sourceforge.net/projects/collectl/) (GPLv2/Artistic License) can be used.

It's also possible to [repurpose cheap switchable power plugs as measurement devices](https://volkerkrause.eu/2020/10/17/kde-cheap-power-measurement-tools.html); see Section ["Alternative: Gosund SP111 Setup"](#sec:gosundPM) for set up instructions.

![Gude Power Meter (Image published under a [XXX]() license)](images/sec3_lab-setup_modified.png)

#### System Under Test (SUT)

The Fujitsu Esprimo P920 Desktop-PC proGreen selection (Intel Core i5-4570 3,6GHz, 4GB RAM, 500GB HDD) is one of the recommended reference systems.

On the reference system you can set up the System Under Test (SUT). The SUT must reduce unrelated energy consumption and have a standardized configuration. This includes the following:

 - Overwriting the entire hard drive of the machine with a standardized OS.

 - Deactivating all possible background processes (automatic updates, backups, indexing, etc.).

 - Installing the necessary software (i.e., the application under consideration as well as the emulation and data collection software).

#### Standard Usage Scenario (SUS)

Preparing the SUS requires the following:

 - Identifying tasks users typically carry out when using the application under consideration.

 - Identifying functionalities which require high energy demand or high resource utilization.

 - Based on the above, scheduling a flow chart of individual actions and emulating these actions with a task automation tool.

 - Note that when running the SUS, the cache should be cleared between runs and any new files deleted before starting the next measurement.

![Steps for preparing Standard Usage Scenario (SUS) scripts to measure the energy consumption of software (image from Karanjot Singh published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license).](images/sec3_PreparingSUS.png)

An example of a standard usage scenario for KMail includes: searching for an email, writing a reply or forwarding the email, saving an attachment, deleting a folder in the mail client, etc. See the [Actiona scripts](https://invent.kde.org/teams/eco/feep/-/tree/master/measurements) used to test KMail, Krita, and Okular for examples.

Note: If the task automation tool uses pixel coordinates to store the position of the automated clicks (e.g., `Actiona`) and, moreover, the screen resolution of the computer used in preparation differs from that of the laboratory computer, all pixel coordinates will eventually have to be set anew for the laboratory environment (Seiwert & Zaczyk 2021: p. 12).

##### Emulation Tools For Usage Scenarios

An automation tool is required which can run the usage scenarios and does not need human intervention, so it can be run repeatedly in a well-defined way to provide accurate measurements.

Beyond [`xdotool`](https://github.com/jordansissel/xdotool), [`KDE Eco Tester` (in progress)](https://invent.kde.org/teams/eco/feep/-/tree/master/tools/KdeEcoTest), or [`Actiona`](https://github.com/Jmgr/actiona), there are other candidates for tools which might meet the requirements. See a list from KDE Contributor David Hurka in the presentation ["Visual Workflow Automation Tools"](https://invent.kde.org/teams/eco/feep/-/tree/master/tools/presentation_Visual_Workflow_Automation_Tools).

Most of those tools use X11-specific features, and thus do not work on Wayland systems. There are a few possible approaches here:

 - [Selenium Webdriver using AT-SPI](https://invent.kde.org/sdk/selenium-webdriver-at-spi) 

 - [The XDG RemoteDesktop portal](https://docs.flatpak.org/en/latest/portal-api-reference.html#gdbus-org.freedesktop.portal.RemoteDesktop)

 - Various Wayland protocols (support varies between compositors):
    - https://github.com/swaywm/wlr-protocols/blob/master/unstable/wlr-virtual-pointer-unstable-v1.xml  
    - https://api.kde.org/frameworks/kwayland/html/classKWayland_1_1Client_1_1FakeInput.html

 - [libinput user devices](https://lwn.net/Articles/801767/)

### Measuring Software

The measurement process is defined in Appendix A of the [Basic Award Criteria](https://produktinfo.blauer-engel.de/uploads/criteriafile/en/DE-UZ%20215-202001-en-Criteria-2020-02-13.pdf). It requires recording and logging energy data and performance indicators with a granularity of 1 second so that they can be processed and average values can be calculated.

Some general comments:

 - Times between the PM and Computer 1 (Data Aggregator & Evaluator) must be synchronized.

 - On Computer 1, confirm that the desired power outlet is read out (e.g., via the live graph created when using `LabPlot`).

 - When using `Collectl` to collect performance load, ensure it is running in the console of the SUT; also, check that the required CSV file is also correctly generated.

 - Since each run of the usage scenarios results in changes to the standard operating system, clearing the cache between runs is recommended.

 - All runs (Baseline, Idle Mode, Standard Usage Scenario) must be for the same length of time, based on the time needed to run the usage scenario script.

During the energy measurement, you also need to record a set of performance indicators: processor utilisation, RAM utilisation, hard disk activity and network traffic. Tool candidate:

 - [`Collectl`](https://sourceforge.net/projects/collectl/)

The following command is used for obtaining hardware performance data with `Collectl` (Mai 2021: p. 15):

`$ collectl -s cdmn -i1 -P --sep 59 -f ~/performanceMeasures.csv`

The specified options are:

 - `-s cdmn`
 
    collect CDU, Disk, memory, and network data

 - `-i1`

    sampling interval of 1 second

 - `-P`

    output in plot format (separated data which consists of a header with one line per sampling interval)

 - `--sep 59`

    semicolon separator for -P option

 - `-f /PATH/TO/FILE.csv`

    save file at specified path

#### Baseline, Idle Mode, And Standard Usage Scenario

 -  Baseline: *Operating System* (OS)

    To establish the baseline energy consumption and hardware performance data of the system under test, a scenario is measured in which the OS is booted and running but no action is taken.

 -  Idle Mode: *OS + Application While Idle*

    To establish the energy consumption and hardware performance data of the application while idle, a scenario is measured in which the application under consideration is opened but no action is taken.

Important: the baseline and idle mode are run for the same time needed to carry out the standard usage scenario. Since the power consumption for the baseline and idle scenario is relatively uniform, 10 repetitions for each is considered sufficient to obtain a representative sample (Seiwert & Zaczyk 2021).

 -  Standard Usage Scenario: *OS + Application In Use*

    To measure the energy consumption and hardware performance data of the application under consideration in use, the standard usage scenario is run. The measurement of the standard usage scenario should be repeated 30 times, taking several hours in total. This higher number of repetitions is necessary to obtain a representative sample, as the energy consumption and performance data may vary across measurements (Seiwert and Zaczyk 2021).

#### <a name="sec:labplot"></a> Monitoring Output With Labplot

You can use KDE's [LabPlot](https://apps.kde.org/labplot2/) to monitor the output live as data is coming in. To do so:

 - Redirect the power meter output to a CSV file.

 - In LabPlot, import the CSV file by going to `File > Add New > Live Data Source ....`

 - Where it says "Filter", select the Custom option. Under "Data Format" define the separator value used (e.g., comma, semi-colon, space).

 - You can check that the output is correct under the "Preview" tab.
 
 - If everything looks good, click OK.
 
 - Now it is just a matter of right-clicking on the data frame window and selecting `Plot Data > xy-Curve`.

### Analysis Of The Results With OSCAR

There is a tool available from Umwelt Campus Birkenfeld which generates reports from measurement data, called `OSCAR` (Open Source Software Consumption Analysis):

  - [Source Code](https://gitlab.umwelt-campus.de/y.becker/oscar-public)

  - [Running instance](https://oscar.umwelt-campus.de/)

At the project website, you can also find the Oscar Manual with detailed instructions, including screenshots on how to use `OSCAR`.

#### CSV Files 

Analysis with `OSCAR` requires uploading the following files to the [OSCAR website](https://oscar.umwelt-campus.de/): (i) a log file of actions taken, (ii) the energy consumption data, and (iii) the hardware performance data. All files are CSV files, examples of which are provided below. Some preprocessing of the raw data may be necessary (e.g., performance data measured by `Collectl`; see below for details).

Important: `OSCAR` is very particular about data frames and column names and some cell values. The tables here provide examples which are confirmed to work. If you are having issues generating a report from your CSV files, make sure CSV files are as shown here.

To test OSCAR yourself, you can download the data for Okular for the baseline and SUS measurements here: <TODO: ADD LINK>. The data has been used to generate a report successfully using fOSCAR v0.190404, which you can download here: <TODO: ADD LINK>.

 - Log File Of Actions

The log file of actions should have the following format. Note the columns are separated by a semi-colon. Also, columns have no names (i.e., there is no header in the CSV file).

|                     |                |           |
|---------------------|----------------|-----------|
| YYYY-MM-DD HH:MM:SS | ; startTestrun | ;         |
| YYYY-MM-DD HH:MM:SS | ;              | ; action1 |
| YYYY-MM-DD HH:MM:SS | ;              | ; action2 |
| YYYY-MM-DD HH:MM:SS | ;              | ; action3 |
| YYYY-MM-DD HH:MM:SS | ; stopTestrun  | ;         |

An example log file of actions for measuring KDE's text editor (and more) [`Kate`](https://apps.kde.org/kate/). Here the (i) date and time as well as (ii) start and stop times and (iii) actions are listed in three columns; note that the start and end of each iteration must be labelled with 'startTestrun' and 'stopTestrun', respectively, whereas the actions can be listed with any name.

|                     |                |                                 |
|---------------------|----------------|---------------------------------|
| 2022-05-21 18:54:36 | ; startTestrun | ;                               |
| 2022-05-21 18:55:41 | ;              | ; go to line 100                |
| 2022-05-21 18:55:46 | ;              | ; toggle comment                |
| 2022-05-21 18:55:50 | ;              | ; find kconfig                  |
| 2022-05-21 18:55:55 | ;              | ; move between searches 6 times |
| 2022-05-21 18:56:05 | ;              | ; close find bar                |
| 2022-05-21 18:56:05 | ;              | ; standby 30 sec                |
| 2022-05-21 18:56:35 | ;              | ; go to line 200                |
| 2022-05-21 18:56:40 | ;              | ; select 10 lines               |
| 2022-05-21 18:56:43 | ;              | ; delete selected text          |
| [...]               | ;              | ; [...]                         |
| 2022-05-21 18:59:13 | ; stopTestrun  | ;                               |
 
 -  Energy Consumption Data

The energy consumption data has the following format: the first column is the row number, the second column is the date and time in one-second increments, and the third column is the result in Watts. Note the following is confirmed to work with OSCAR: (i) the second and third column names as written below, (ii) the date-time as a character string with the date and time separated by a comma, and (iii) no string delimiter used in the CSV file.

|   | ; Zeit               | ; Wert 1-avg[W] |
|---|----------------------|-----------------|
| 1 | ; DD.MM.YY, HH:MM:SS | ; value1        |
| 2 | ; DD.MM.YY, HH:MM:SS | ; value2        |
| 3 | ; DD.MM.YY, HH:MM:SS | ; value3        |
| 4 | ; DD.MM.YY, HH:MM:SS | ; value4        |

When using the Gude Power Meter with the [Python script](https://invent.kde.org/teams/eco/feep/-/tree/master/tools/GUDEPowerMeter) available at the FEEP repository, the timestamp will be recorded in nanoseconds in [Epoch time](https://en.wikipedia.org/wiki/Epoch_time). For example, below is an example of the raw output for 7 rows from the Gude Power Meter output from the script. The first column shows the timestamp. The second column is the readout from the power meter in Watts.

|                  |    |
|------------------|----|
| 1661611923019071 | 43 |
| 1661611923142924 | 43 |
| 1661611924293989 | 29 |
| 1661611924417017 | 28 |
| 1661611924744885 | 28 |
| 1661611924869051 | 28 |
| 1661611924992392 | 28 |

The raw data can be preprocessed in R. Nanoseconds in Epoch time are converted to date-time with the command `as.POSIXct(<NANOSECONDS>/1000000, origin = '1970-01-01', tz = 'Europe/Berlin')`. For example, the nanoseconds in row 1 from the raw output is, after conversion, "2022-08-27 16:52:03 CEST". For OSCAR, this date-time can then be converted to a character string with the date as DD.MM.YY followed by a comma. All of this can be achieved with one command (this operation should be run over the entire column):

`stringr::str_replace(as.character(as.POSIXct(1661611923019071/1000000, origin = '1970-01-01', tz = 'Europe/Berlin')), '2022-08-27', '27.08.22,')`

The third column are the Watts averaged per second. The same data above is shown below after preprocessing with R; note the 7 values above are averaged per second, resulting in two rows. To save the CSV file with a semi-colon separator, the first column with row names starting at the number 1, and no string delimiter, this R command can be used: `write.csv2(<DATA FRAME>, file = <PATH/TO/FILE.csv>, row.names = TRUE, quote = FALSE)`.

|   | ; Zeit             | ; Wert 1-avg[W] |
|---|--------------------|-----------------|
| 1 | 27.08.22, 16:52:03 | 43.00000        |	
| 2 | 27.08.22, 16:52:04 | 28.20000        |

 - Performance Data (Raw)

When using `Collectl` for collecting hardware performance data it is necessary to do the following before uploading the data to OSCAR (see Seiwert & Zaczyk 2021: p. 13 for details; see also Appendix A 2 on p. 46 for a Python script to automate some of these tasks):

 - All information above the header row can be removed.

 - Remove all \# characters from the file.

 - In the first column no separator value should come between the data-time, otherwise the date and time will be interpreted as two separate columns.

 - Moreover, the date should have a character inserted between YYYYMMDD, e.g., MM.DD.YYYY as above. Whatever character is used must be specified in OSCAR.
 
 - Column names can be anything you want as they will be specified within `OSCAR`.

 - The file must be saved in CSV format.

Moreover, the hardware performance output from `Collectl` includes many columns that are not necessary for analyzing the data with `OSCAR`. The only measurements that need to be specified are the following columns: [CPU]Totl = Processor; [MEM]Used = Main memory - used kilobytes; [NET]RxKBTot = Network - Kilobytes received/s; [NET]TxKBTot = Network - Kilobytes transmitted/s; [DSK]ReadKBTot = Disk - Kilobytes read/s; and [DSK]WriteKBTot = Disk - kilobytes written/s. In the `OSCAR` interface, you can select NA for unused columns, e.g., "Auslastung Auslagerungsdatei".

Below is an example of the preprocessed results from `Collectl` measuring the performance data for Kate. The timestamp again increases in one-second increments.

| | | | | | | |
| Date-Time | cpu | mem | net_rec | net_trn | dsc_rd | dsc_wr |
|-|-|-|-|-|-|-|
| 27.08.2022 16:47:10 | 1 | 7131968 | 0 | 0 | 0 | 0 |
| 27.08.2022 16:47:11 | 4 | 7131968 | 0 | 0 | 0 | 0 |
| 27.08.2022 16:47:12 | 1 | 7131968 | 0 | 0 | 0 | 0 |
| 27.08.2022 16:47:13 | 1 | 7131968 | 0 | 0 | 0 | 120 |
| 27.08.2022 16:47:14 | 1 | 7131968 | 0 | 0 | 0 | 0 |
| 27.08.2022 16:47:15 | 1 | 7131968 | 0 | 0 | 0 | 56 |
| 27.08.2022 16:47:16 | 1 | 7131968 | 0 | 0 | 0 | 48 |
| 27.08.2022 16:47:17 | 1 | 7131968 | 0 | 0 | 0 | 0 |
| 27.08.2022 16:47:18 | 1 | 7131968 | 0 | 0 | 0 | 0 |
| 27.08.2022 16:47:19 | 4 | 7131968 | 0 | 0 | 0 | 132 |

#### Uploading Data

Once the necessary files are ready, you can begin the analysis of the idle mode and standard usage scenario measurements using [OSCAR](https://oscar.umwelt-campus.de/). OSCAR will generate a summary report you can use for eco-certification or for your own purposes. In the OSCAR interface, note the following:

 - The interface language is currently German; see below for some translations.

 - The duration of the measurements in seconds must be specified.

 - [TODO: CHECK] Only the semicolon must be used as a separator.

 - The correct formatting of the time stamp must be specified for each of the uploaded files, e.g.,`%Y-%m-%d %H:%M:%OS`.

##### Step 1: Obtain Measurement Data

As stated at the landing page of the website (see below), the first step is obtaining measurement data (German: *Erfassung Messdaten*). 

![Oscar screenshot with the first step of obtaining measurement data (German: "Erfassung Messdaten").](images/sec3_oscar_1_landing.png)

##### Step 2: Upload Measurement Data

Once you have the baseline, idle mode, and usage scenario measurements, click on *(2) Upload Messdaten*, which in English means "upload measurement data".

Under *Messungen*, you upload either the idle mode or standard usage scenario measurements.  Under *Baselines* you upload the baseline measurements. For all data, the log file of actions taken (German: *Aktionen*), energy consumption (German: *Elektrische Leistung*), and hardware performance data (German: *Hardware-Auslastung*) are uploaded.

For *Art der Messung* ('Type of Measurement') in the lower right of the following screenshot, select *Leerlauf* ('Idle Mode') or *Nutzungsszenario* ('Usage Scenario') depending on which report you wish to generate (here *Nutzungsszenario* was selected). Note that the baseline measurements are always uploaded along with the idle mode or standard usage scenario measurements. It is important to also indicate the duration of the individual measurements in seconds (German: *Dauer der Einzelmessungen (s)*). See below for what a completed upload for the *Nutzungsszenario* with a duration of 217 seconds looks like:

![Oscar screenshot with the second step of uploading measurement data (German: "Upload Messdaten").](images/sec3_oscar_2_upload.png)

Once the data has been uploaded, you will need to tell OSCAR how to read the data. Let us start with the timestamp, since this is one aspect of the process which can cause problems if not done correctly. As an example, consider the Okular data:

 - For the log file of actions (German: *Aktionen*), the datetime is encoded as *YYYY-MM-DD HH:MM:SS*, e.g., "2022-10-04 12:32:43.656" in the data "okularActions.csv" for the baseline measurements (note the hyphen in the date; OSCAR will take care of the fractional seconds).
  
   In OSCAR this is specified so: "%Y-%m-%d %H:%M:%OS" (see screenshot below).

 - For the energy consumption data (German: *Elektrische Leistung*), the datetime is encoded as *DD.MM.YY, HH:MM:SS*, e.g.,  "04.10.22, 12:32:43" in the data "okular_baseline_eletrLeistung.csv" for the baseline measurements (note the period in the date and the comma seperating the date and time, as well as only having two digits for the year).
  
   In OSCAR this is specified so: "%d.%m.%y, %H:%M:%OS" (see screenshot below), in which the lowercase "%y" indicates only two digits for the year.

 - For the hardware performance data (German: *Hardware-Auslastung*), the datetime is encoded as *DD.MM.YYYY HH:MM:SS*, e.g.,  "04.10.2022 12:31:43" in the data "baseline_hardware_formatiert.csv" for the baseline measurements (note the period in the date and having four digits for the year).
  
   In OSCAR this is specified so: "%d.%m.%Y %H:%M:%OS" (see screenshot below), in which the uppercase "%Y" indicates four digits for the year.

![Oscar screenshot for uploading the measurement data where one specifies the format of the timestamp (German: "Formatierung Zeitstempel").](images/sec3_oscar_3_timestamp.png)

After the timestamps have been correctly specified, let's look at reading the format of the measurement data (German: *Formatierung Messdaten*) in OSCAR. First, we will do so for the log file of actions (German: *Aktionen*). Here you need to indicate for the uploaded CSV file the separator (German: *Trennzeichen*), the string delimiter (German: *Textqualifizierer*), the decimal separator (German: *Dezimaltrennzeichen*). For the Okular data, this is defined as follows in the following screenshot: semi-colon separator, double quotation string delimiter, and a period or full-stop decimal separator.

Additionally you will need to indicate whether the first line contains headings (German: *Erste Zeile enthält Überschriften*); if necessary, the number of lines to skip (German: *Anzahl zu überspringender Zeilen*); and the character encoding (German: *Zeichensatz (Encoding)*). For the Okular data, this is defined as follows in the following screenshot: first line contains headings is unchecked, 0 lines are skipped, and character encoding is utf-8. Since everything is specified correctly, a preview of the spreadsheet is shown in OSCAR.

![Oscar screenshot for the log file of actions (German: "Aktionen") where one specifies the format of the measurement data (German: "Formatierung Messdaten").](images/sec3_oscar_4_actions.png)

For the energy consumption measurements (German: *Elektrische Leistung*), the required input is the same as for the log file of actions, seen in the following screenshot. For the sake of concreteness, for the Okular data there is a semi-colon separator, double quotation string delimiter, and the character encoding is utf-8. However, now the decimal separator is a comma, that the first line contains headings is checked, and 1 line is skipped. You can confirm this is correct by inspecting the CSV file directly. Since everything is specified correctly, a preview of the spreadsheet is shown in OSCAR.

![Oscar screenshot for the energy consumption measurements (German: "Elektrische Leistung") where one specifies the format of the measurement data (German: "Formatierung Messdaten").](images/sec3_oscar_5_energy.png)

For the hardware performance data (German: *Hardware-Auslastung*), the required input is the same, but now with the additional requirement of specifying the columns. For the sake of concreteness, in the following there is a semi-colon separator, double quotation string delimiter, period or full stop decimal separator, that the first line contains headings is checked, 0 lines are skipped, and the character encoding is utf-8. For the columns (German: *Spalten*) specification, the following are defined:

 - *Zeitstempel*: Datetime (i.e., 'Date-Time')
 - *CPU-Auslastung*: CPU (i.e., 'X.CPU.Totl')
 - *RAM-Auslastung*: RAM (i.e., 'X.MEM.Used')
 - *Über Netzwerk gesendet*: Network transmitted (i.e., 'X.NET.TxKBTot')
 - *Über Netzwerk empfangen*: Network received (i.e., 'X.NET.RxKBTot')
 - *Von Festplatte gelesen*: Disk read (i.e., 'X.DSK.ReadKBTot')
 - *Auf Festplatte geschrieben*: Disk written (i.e., 'X.DSK.WriteKBTot')
 - *Auslastung Auslagerungsdatei*: Swap (here, 'N/A')

![Oscar screenshot for the energy consumption measurements (German: "Hardware-Auslastung") where one specifies the format of the measurement data (German: "Formatierung Messdaten").](images/sec3_oscar_6_hw.png)

#### Translations

Here is an overview of some of the terminology in German and their English translations:

 - *Messungen*: Measurements (e.g., Idle Mode or SUS)
 - *Aktionen*: Actions (i.e., log file of actions taken)
 - *Elektrische Leistung*: 'Electrical power' (i.e., energy consumption measurements)
 - *Hardware-Auslastung*: 'Hardware load' (i.e., hardware performance measurements)
 - *Dauer der Einzelmessungen (s)*: 'Duration of the individual measurements (s)' (i.e., specify how long each iteration was in seconds)
 - *Art der Messung*: 'Type of measurement'
     - *Leerlauf*: 'Idle' (i.e., Idle mode)
     - *Nutzungsszenario*: 'Usage scenario' (i.e., SUS)

 - *Formatierung Messdaten*: 'Formatting measurement data'
 - *Formatierung Zeitstempel*: 'Formatting timestamp'

 - *Trennzeichen* 'Separator'
 - *Textqualifizierer*: 'String delimiter'
 - *Dezimaltrennzeichen*: 'Decimal separator'
 - *Erste Zeile enthält Überschriften*: 'First line contains headings'
 - *Anzahl zu überspringender Zeilen*: 'Number of lines to skip'
 - *Zeichensatz (Encoding)*: 'Character set (encoding)'
 
 - *Spalten*: Columns
     - *Zeitstempel*: 'Datetime'
     - *CPU-Auslastung*: 'CPU utilization'
     - *RAM-Auslastung*: 'RAM utilization'
     - *Über Netzwerk gesendet*: 'Sent via network'
     - *Über Netzwerk empfangen*: 'Received via network'
     - *Von Festplatte gelesen*: 'Read from disk'
     - *Auf Festplatte geschrieben*: 'Written to disk'
     - *Auslastung Auslagerungsdatei*: 'Swap file utlization'

#### Downloading Reports

After completing the above, the report can be generated and downloaded, resulting in two documents: a report for the baseline and idle mode, and a report for the baseline and standard usage scenario.

![TODO: ADD CAPTION](images/sec3_oscar_7_report.png)

### Submitting Documentation For Blue Angel

For Blue Angel eco-certification, it is necessary to complete several documents with the above information as well as the energy consumption reports. The information that needs to be included is as follows:

 - Details about the software (name, version, etc) and measurement process (when and where measurements were made, etc.)

 - Technical details about the power meter (instrument, sampling frequency, length of scenario, sample size)

 - Technical details about the reference system (year, model, processor, cores, etc.)

 - Software stack used for measurements (`xdotool`, `Collectl`, etc.)

 - Minimum system requirements (processor architecture, local working memory, etc.)

 - Energy consumption measurements are found in the OSCAR reports or equivalent.

 - Hardware utilization measurements, which includes the following (for IDLE use Idle Mode measurements, and for SUS use SUS measurements):
   - *Full Load*: "For processing power, the full load is 100%, for working memory the sum of the installed RAM capacities, for network bandwidth the maximum transmission speed, etc." (Blue Angel award criteria: p. 23)
   - *Base Load*: Average load for the reference system in Baseline measurements
   - *Idle/SUS Load*: Average load for the reference system for IDLE/SUS measurements
   
     From the above measurements, the following calculations are made for hardware utilization (for IDLE use Idle Mode measurements, and for SUS use SUS measurements):
     - *Net Load*: IDLE/SUS Load - Base Load
     - *Allocation Factor*: Net Load/(Full Load - Base Load)
     - *Effective Load*: Net Load + Allocation Factor * Base Load
     - *Hardware Utilization* (SUS only): Effective Load * Time (seconds)

### More References

The measurement process is also described in the following documents:

 - [Resource and Energy-Efficient Software Products: Basic Award Criteria (Edition January 2020, Version 1)](https://www.blauer-engel.de/en/productworld/resources-and-energy-efficient-software-products)

 - Mai, Franziska (2021) *Vergleichende Analyse und Bewertung von Betriebssystemen hinsichtlich ihrer Energieeffizienz* (German only),

 - Seiwert & Zaczyk (2021) [*Projektbericht: Ressourceneffiziente Softwaresysteme am Beispiel von KDE-Software*](https://invent.kde.org/teams/eco/feep/-/blob/master/measurements/abschlussbericht-kmail-krita.pdf) (German only),

 - [OSCAR Manual](https://gitlab.umwelt-campus.de/y.becker/oscar-public/blob/master/OSCAR/static/OSCAR_Gesamt.pdf) (German only), and

 - Section 4.1 of Kern et al. (2018), *[Sustainable software products--Towards assessment criteria for resource and energy efficiency](https://doi.org/10.1016/j.future.2018.02.044)*.

### <a name="sec:gosundPM"></a> Alternative: Gosund SP111 Setup

Want to get started with the process, but short on cash or gear? Want to give the process a try without setting up a dedicated lab? Try this hack converting an inexpensive power plug to a power meter, courtesy of Volker Krause, who also documented the process in detail. You can read more at the following blog posts from Volker's blog:

 - ["Cheap Electric Power Measurement"](https://web.archive.org/web/20221002125057/https://volkerkrause.eu/2020/10/17/kde-cheap-power-measurement-tools.html)

 - ["KDE Eco Sprint July 2022"](https://web.archive.org/web/20220819231538/https://www.volkerkrause.eu/2022/07/23/kde-eco-sprint-july-2022.html)

Below is a guide to setting up a [Gosund SP111](https://templates.blakadder.com/gosund_SP111_v2.html) power plug already [flashed](https://github.com/tasmota/docs/blob/development/docs/devices/BlitzWolf-SHP6.md) with [Tasmota firmware](https://tasmota.github.io/docs) in 10 or fewer steps.

Although the data from this inexpensive power meter will likely not be accepted by the Blue Angel for eco-certification, it is nonetheless possible to obtain preliminary data using this tool.

 - (0) *Prerequisite*
 
    It is necessary to have the power plug already flashed with a sufficiently new Tasmota version.

 - (1) *Firmware Reset*
 
    If the device had previously been connected to another Wifi it might need a full reset before being able to connect to a new one.

    If the device did open a WiFi access point named "tasmota-XXXXX" this is not needed, continue directly to (2).

    Press the button for 40 seconds.

    The device will restart and you should be able to continue at (2).

 - (2) *WiFi Setup*

    The device opens a WiFi access point named "tasmota-XXXXX"&mdash;connect to that.

    Open http://192.168.4.1 in a browser.

    The device asks you for the WiFi name and password to connect to after entering those. The device will reconnect to that WiFi and disable its access point.

    While doing that it should show you its new address in the browser &mdash; make a note of that.

    In case that did not happen, check your WiFi router for the address of the device.

 - (3) *Tasmota Setup*

    Open the address from step (2) in a browser.

    You should see the Tasmota web UI (a big "ON/OFF" text and a bunch of blue and one red button).

    Click "Configuration".

    Click "Configure Other".

    Copy

            {"NAME":"Gosund SP111 2","GPIO":
            [56,0,57,0,132,134,0,0,131,17,0,21,0],"FLAG":0,
            "BASE":18}

    into the template input field.

    Tick the "Activate" checkbox.

    Click "Save".

    The device will restart; connect to it again.

    The UI should now also contain text fields showing electrical properties, and the "Toggle" button should now actually work.

 - (4) *Calibration*

    Open the address from step (2) in a browser.

    Connect a purely resistive load with a known wattage, such as a conventional light bulb (not a LED or energy-saving bulb).

    Switch on power by clicking "Toggle" if needed.

    Verify that the "Power Factor" value is shown as 1 (or very close to 1); if it is lower the current load is not suited for calibration.

    Click "Console".

    Enter the following commands one at a time and press enter:

          AmpRes 3  
          VoltRes 3  
          EnergyRes 3  
          WattRes 3  
          FreqRes 3  
          SetOption21 1
          VoltageSet 230

    Enter the command PowerSet XXX with XXX replaced by the wattage specified for the test load (e.g., "40" for a 40W light bulb).

    Click "Main Menu".

    The main page now should show correct power readings with several decimals precision.

 - (5) *MQTT Broker Setup*

    The only known way for high-frequency automatic readouts so far is polling over MQTT. This is not ideal and needs additional setup, unfortunately.

    If you happen to have a MQTT Broker around already, skip to step (6); otherwise, you need to set one up. The below scenario assumes Mosquitto is packaged for your distribution (and therefore does not configure any security), so only do this in your own trusted network and switch it off when not needed.

   - install the `mosquitto` package
   - add a file `/etc/mosquitto/conf.d/listen.conf` with the following content:

          listener 1883  
          allow_anonymous true

   - start Mosquitto using `systemctl start mosquitto.service`

 - (6) *MQTT Tasmota Setup*

    Connect to the Tasmota device using a web browser, and open the MQTT configuration page via Configuration > Configure MQTT.
    
    Enter the IP address of the MQTT broker into the "Host" field.

    Note down the value shown right of the "Topic" label in parenthesis (typically something like "tasmota_xxxxxx"). This will be needed later on to address the device via MQTT. You can also change the default value to something easier to remember, but this has to be unique if you have multiple devices.

    Click "Save".

    The device will restart and once it is back you should see output in its Console prefixed with "MQT".

 - (7) *Verifying MQTT Communication*

    This assumes you have the Mosquitto client tools installed, which are usually available as distribution packages.

    You need two terminals to verify MQTT communication works as intended.

        - In terminal 1, run `mosquitto_sub -t 'stat/<topic>/STATUS10'`
        - In terminal 2, run `mosquitto_pub -t 'cmnd/<topic>/STATUS' -m '10'`

    Replace `<topic>` with the value noted down in step (6).

    Everytime you run the second command, you should see a set of values printed in the first terminal.

 - (8) *Continuous Power Measurements*

    See [these scripts](https://volkerkrause.eu/2020/10/17/kde-cheap-power-measurement-tools.html).

 - (9) *Switching WiFi Networks*

    For security reasons, once connected to a WiFi network, Tasmota will not let you get back to step (2) by default without hard resetting the device (40-second button press). That, however, also removes all settings and the calibration. If you need to move to a different network, there are less drastic options available, but these changes can only be made inside the network you originally connected to:

    Under Configuration > Configure WiFi, you can add details for a second WiFi access point. Those will be tried alternatingly with the first configuration by default. This does not compromise security, but requires you to know the details for the network you want to connect to.

    You can configure Tasmota to open an access point as in step (2) by default for a minute or so after boot, and then try to connect to the known configurations. This makes booting slower in known networks, and opens the potential for hijacking the device, but it can be convenient when switching to unknown networks. This mode can be enabled in the Console by the command `WifiConfig 2`, and disabled by the command `WifiConfig 4`.

    For Tasmota version 11 the 40-second button press reset can leave the device in a non-booting state, whereas resetting from the Console using `Reset 1` doesn't have that problem, but has to be done before disconnecting from the known WiFi as well.

 - (10) *Recovering Non-Booting Devices*
 
    First and foremost: **DO NOT CONNECT THE DEVICE TO MAIN POWER**! That would be life-threatening. The entire flashing process is solely powered from 3.3V supplied by the serial adapter. Do not do any of this without having read this [getting started guide](https://tasmota.github.io/docs/Getting-Started/).

    With Tasmota 11, you can end up in a non-booting state by merely resetting the device using the 40-second button press. This does not permanently damage the device, and it can be fixed with reflashing via a serial adapter.

    The basic process is described in the above [guide](https://tasmota.github.io/docs/Getting-Started/). The PCB layout of the Gosund SP 111 can be seen [here](https://templates.blakadder.com/gosund_SP111_v1_1).

    In order for this to work, you need to connect GPIO0 (second pin on bottom left in the above image) to GND **before** powering up (i.e., before connecting with USB). The device LEDs (red and blue) are a useful indicator of whether you ended up in the right boot mode: the red LED should be on, and not flashing quickly, and the blue and red LED should not be on together. Once in that state, the connection can be removed (e.g., if you just hold a jumper cable to the pin) and it will remain in the right mode until a reboot.

    Again: **DO NOT CONNECT THE DEVICE TO MAIN POWER** as this is life-threatening; see above.

### Other Initiatives Working On Sustainable Software Tooling

There are many initiatives working on digital sustainability by providing the tooling necessary for measuring the energy consumption of software. We would like to mention four in particular who have been working together with the KDE Eco initiative:

 - [The Green Software Engineering work group](https://www.umwelt-campus.de/en/green-software-engineering) at the [Environmental Campus Birkenfeld](https://www.umwelt-campus.de/en/)
 
   Since 2008 the Green Software Engineering work group have been working on research projects with a focus on sustainable software. Their team developed tools such as `OSCAR` and have measured various KDE applications, including Okular.

 - [Green Coding Berlin](https://www.green-coding.org/)
 
   Green Coding Berlin is focused on research into the energy consumption of software and its infrastructure, creating open source measurement tools, and building a community and ecosystem around green software. 

 - The [SoftAWERE](https://sdialliance.org/steering-groups/softawere) project from the [Sustainable Digital Infrastructure Alliance](https://sdialliance.org/)
 
   The SoftAWERE steering group oversees and sets the direction for the development of tools and labels for energy-efficient software applications.

 - [Green Web Foundation](https://www.thegreenwebfoundation.org/)
 
   The Green Web Foundation tracks and accelerates the transition to a fossil-free internet.

## (B) Hardware Operating Life

Many FOSS applications run on hardware much older than 5 years. In fact, members of the KDE community have noted that KDE's desktop environment `Plasma` runs on hardware from even 2005!

This category is relatively easily to fulfill for the Blue Angel application. To demonstrate compliance for Blue Angel certification, one needs the following information:

 - *Reference System Year* &mdash; e.g., 2015

 - *Model* &mdash; e.g., Fujitsu Esprimo 920

 - *Processor* &mdash; e.g., Intel Core i5-4570

 - *Cores* &mdash; e.g., 4

 - *Clock Speed* &mdash; e.g., 3,6 GHz

 - *RAM* &mdash; e.g., 4 GB

 - *Hard Disk (SSD/HDD)* &mdash; e.g., 500 GB

 - *Graphics Card* &mdash; e.g., Intel Ivybridge Desktop

 - *Network* &mdash; e.g., Realtek Ethernet

 - *Cache* &mdash; e.g., 6144 KB

 - *Mainboard* &mdash; e.g., Fujitsu D3171-A1

 - *Operating System* &mdash; e.g., Ubuntu 18.04

For Blue Angel eco-certification, the above data needs to be added to 2 documents called "Annex 1" and "Annex 2". You can find examples for Okular at the following links:

 - Annex 1: https://invent.kde.org/teams/eco/blue-angel-application/-/blob/master/applications/okular/de-uz-215-eng-annex-1-okular.docx
 - Annex 2: https://invent.kde.org/teams/eco/blue-angel-application/-/blob/master/applications/okular/de-uz-215-eng-annex-2-okular.xlsx

## (C) User Autonomy

As discussed in Part II, the Blue Angel user autonomy criteria cover eight general areas:

  1. Data Formats

  2. Transparency

  3. Continuity Of Support

  4. Uninstallability

  5. Offline Capability

  6. Modularity

  7. Freedom From Advertising

  8. Documentation

Many FOSS projects may take for granted that Free Software respects user autonomy, and in some cases information from the above list is missing from websites, manuals, wikis, etc&mdash;things like support for open standards in data formats, uninstallability, or continuity of support.

Documenting this information is important, both for fulfilling the Blue Angel award criteria and for giving users information about long-term sustainable use of their software and hardware. KDE and FOSS communities know Free Software respects its users&mdash;now, let's make sure everyone else knows it too!

This is not an exhaustive presentation for each of the above categories of the Blue Angel criteria. Rather, this guide focuses on aspects of the criteria which KDE/FOSS projects can easily document and provide (which is already most of the work). For the full criteria, see Section 3.1.3 in the [award criteria](https://produktinfo.blauer-engel.de/uploads/criteriafile/en/DE-UZ%20215-202001-en-Criteria-2020-02-13.pdf).

### 2.1 Data Formats

The main information to include in documentation:

 - Which (open) data formats are supported&mdash;with links to specifications, e.g., [PDF](https://www.iso.org/standard/51502.html)?

 - Also of interest: Are there examples of other software products that process these data formats?

For an example of the online documentation of supported data formats for Okular, see https://okular.kde.org/formats/.

For an example of documentation in a Blue Angel application, see https://invent.kde.org/teams/eco/blue-angel-application/-/blob/master/applications/okular/de-uz-215-eng-annex-4-okular.md.


### 2.2 Transparency Of The Software Product

When missing, provide links to documentation of the API, source code, and the license.

For the sake of example, for KMail:

 - KDE PIM API documentation: https://api.kde.org/kdepim/index.html.

 - Source code: https://invent.kde.org/pim/kmail.

 - License: https://invent.kde.org/pim/kmail/-/blob/master/LICENSES.

For an example of documentation in a Blue Angel application, see: https://invent.kde.org/teams/eco/blue-angel-application/-/blob/master/applications/kmail/de-uz-215-eng-annex-5-kmail.md.


### 2.3 Continuity Of Support

Examples of details about continuity of support to add to documentation:

 - Information about how long the software has been supported for (with links to release announcements).

 - Release schedule and details (e.g., who maintains the software).

 - Statement that updates are free of charge.

 - Declaration on how the free and open source software license enables continuous support indefinitely.

 - Information about whether, and how, functional and security updates may be installed separately.

An example of Okular's continuity of support documentation for Blue Angel certification can be found in Section 3.1.3.3 here: https://invent.kde.org/teams/eco/blue-angel-application/-/blob/master/applications/okular/de-uz-215-eng-annex-6-okular.md.

### 2.4 Uninstallability

How can one completely uninstall the software? Relevant details may include:

 - Uninstallation depends on how the software was installed (source code or binary).

 - Examples of uninstallation instructions (source code or package managers, with relevant links to documentation).

 - Information about whether user-generated data is also removed when uninstalling a program.

An example of Okular's uninstallability documentation for Blue Angel certification can be found in Section 3.1.3.4 here: https://invent.kde.org/teams/eco/blue-angel-application/-/blob/master/applications/okular/de-uz-215-eng-annex-6-okular.md.

### 2.5 Offline Capability

This could be one of the easiest areas for most FOSS projects to document (alongside freedom from advertising; see below): Does the software require external connections such as a license server in order to run? If not, and no network connection is needed and the software is capable offline, this should be documented.

An example of Okular's offline capability documentation for Blue Angel certification can be found in Section 3.1.3.5 here: https://invent.kde.org/teams/eco/blue-angel-application/-/blob/master/applications/okular/de-uz-215-eng-annex-6-okular.md.

### 2.6 Modularity

Information to document includes:

 - What aspects of the software are modular and can be deactivated during installation?

 - Can the software manuals or translations be installed separately?

 - Are any modules unrelated to the core functionality of the software included with installation, such as tracking modules or cloud integration? If not, document it!

An example of Okular's modularity documentation for Blue Angel certification can be found in Section 3.1.3.6 here: https://invent.kde.org/teams/eco/blue-angel-application/-/blob/master/applications/okular/de-uz-215-eng-annex-6-okular.md.

### 2.7 Freedom From Advertising

If the software does not display advertising, make this explicit in manuals and wikis and declare it in the Blue Angel application document.

### 2.8 Documentation

This includes the following:

 - General process for installing/uninstalling the software? (This may include generic instructions or tutorials for a specific desktop environment or package manager.)

 - Data import/export process?

 - What can users do to reduce the use of resources (e.g., configuration options for improving performance)?

 - Does the software have any resource-intensive functionality not necessary for the core functionality? If not, great. Let's tell the users!

 - Licensing terms related to further development of the software products, with links to source code and license?

 - Who supports the development of the software?

 - Does the software collect any personal data? Is is compliant with existing data protection laws? If yes, document it!

 - What is the privacy policy? Is there telemetry, and if yes, how does the software handle data security, data collection, and data transmission? Also, are there ads or tracking embedded in the software? If not, excellent&mdash;now make sure to spread the word!

An example of Okular's product documentation for Blue Angel certification can be found in Section 3.1.3.8 here: https://invent.kde.org/teams/eco/blue-angel-application/-/blob/master/applications/okular/de-uz-215-eng-annex-6-okular.md.

#### Examples

Below are examples of Blue Angel documentation for Okular.

 - Annex 4: Data Formats (Section 2.1)
   - https://invent.kde.org/teams/eco/blue-angel-application/-/blob/master/applications/okular/de-uz-215-eng-annex-4-okular.md

 - Annex 5: Open Standards (Transparency Section 2.2)
   - https://invent.kde.org/teams/eco/blue-angel-application/-/blob/master/applications/okular/de-uz-215-eng-annex-5-okular.md

 - Annex 6: Product Information (Sections 2.3–2.8)
   - https://invent.kde.org/teams/eco/blue-angel-application/-/blob/master/applications/okular/de-uz-215-eng-annex-6-okular.md

 - See also Annex 1
   - https://invent.kde.org/teams/eco/blue-angel-application/-/blob/master/applications/okular/de-uz-215-eng-annex-1-okular.docx
   

## Submitting Your Application For The Blue Angel

Once you have all of the above documentation prepared, you need to submit it for review to RAL gGmbH (if you recall, RAL is the authorized body that assesses compliance with the award criteria). The portal for submitting Blue Angel applications is here:

 - https://portal.ral-umwelt.de/.

If you need help with the online interface, RAL provides [documentation](https://portal.ral-umwelt.de/RALUmwelt/Anleitung/1).

## Benefits Of Blue Angel

Steffi Lemke, Federal Minister for the Environment, Nature Conservation, Nuclear Safety and Consumer Protection (German: *Bundesministerium für Umwelt, Naturschutz, nukleare Sicherheit und Verbraucherschutz*, or BMUV), has said [about the reputation of the Blue Angel](https://www.blauer-engel.de/en/blue-angel/our-label-environment):

> An increasing number of people focus on durability and environmental friendliness when purchasing products. This is precisely what the Blue Angel stands for. The ecolabel has been a guarantee of high standards for the protection for our environment and health for 40 years in an independent and credible way.

Indeed, in their 40<sup>th</sup> anniversary info-booklet ["Blue Angel &ndash; 40 years. Good for me. Good for the environment"](https://www.umweltbundesamt.de/sites/default/files/medien/1410/publikationen/uba_40jahreblauerengel_publikation_en_web.pdf), the German Environment Agency (UBA) explored the history, present, and future of the ecolabel. In the booklet they identify some of the general criteria they consider when eco-certifying a product, such as:

 - reduced emissions of harmful substances in the ground, air, water and indoors;

 - sustainable production of resources;
 
 - longevity, ability to repair and recycle the product; and

 - efficient use, e.g. products which save energy.

As you reach the end of this handbook, we hope it is clear how eco-certification of desktop software promotes the above environmental benefits, among others.

Environmental labels can be an instrument to move markets in the direction of sustainable products. The Blue Angel website states, "The aim of the environmental label is to provide private customers, large institutional consumers and public institutions with reliable guidance for environmentally conscious purchasing."

So what does the market say?
 
A survey from the above info-booklet found that 92% of Germans recognize the ecolabel, and for 37% the label influences their purchasing choices. The label is recognizable outside of Germany, too! In conversations with representatives at the German Environment Agency we were informed that up to 15% of Blue Angel recipients are outside of Germany. One reason for this is that unlike some other ecolabels, the Blue Angel puts no requirements on where a product can be marketed. Moreover, the Blue Angel seal is considered a mark of high quality internationally, and the award criteria are viewed as an indicator of direction of the EU market&mdash;and even used as a guideline for optimizing products.

Receiving the Blue Angel seal can raise your product's profile not only among individuals but also large organizations. [Green Public Procurement](https://en.wikipedia.org/wiki/Sustainable_procurement) (GPP) initiatives, which "seek to promote the public procurement of goods, services, and works with a reduced environmental impact throughout their life-cycle" ([European Commission](https://ec.europa.eu/environment/gpp/faq_en.htm)), influence purchasing choices both in the public and [private sector](https://en.wikipedia.org/wiki/Sustainable_procurement#Private_sector). Eco-certifying your software product with the Blue Angel demonstrates a commitment to long-term digital sustainability, and it gives your product visibility both in Germany and abroad.

The *Blauer Engel Für FOSS* project was funded by the Federal German Environment Agency (UBA) and the Federal Ministry for the Environment, Nature Conservation, Nuclear Safety and Consumer Protection (BMUV). The funds are made available by resolution of the German Bundestag.

![Logo of the Federal German Environment Agency.](images/sec4_uba.jpg)

![Logo of the Federal Ministry for the Environment, Nature Conservation, Nuclear Safety and Consumer Protection.](images/sec4_bmuv.png)

The publisher is responsible for the content of this publication.

