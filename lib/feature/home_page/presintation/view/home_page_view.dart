import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/app_color.dart';
import 'package:weather_app/feature/home_page/presintation/provider/weather_provider.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 233, 237),
      appBar: AppBar(
        title: Text(
          'Weather',
          style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        surfaceTintColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: AppColors.secondryColor.withValues(alpha: 0.2),
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.secondryColor.withValues(alpha: 0.2),
                  ),
                  color: AppColors.secondryColor.withValues(alpha: 0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 4.0,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: AppColors.secondryColor.withValues(alpha: 0.8),
                        size: 22,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          onSubmitted: (value) {
                            context.read<WeatherProvider>().getWeather(value);
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Search city',
                            hintStyle: GoogleFonts.inter(
                              color: AppColors.secondryColor.withValues(
                                alpha: 0.8,
                              ),
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Consumer<WeatherProvider>(
                builder: (context, provider, child) {
                  switch (provider.appState) {
                    case AppState.initial:
                      return const SizedBox();
                    case AppState.load:
                      return const Padding(
                        padding: EdgeInsets.all(32),
                        child: CircularProgressIndicator(),
                      );
                    case AppState.error:
                      return Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(provider.errorMessage),
                      );
                    case AppState.succes:
                      final weather = provider.weather!;
                      return SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              weather.city,
                              style: GoogleFonts.inter(
                                fontSize: 35,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textDark,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(
                                  'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  weather.description,
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.secondryColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '${weather.temp.round()}°',
                              style: GoogleFonts.inter(
                                fontSize: 60,
                                fontWeight: FontWeight.w300,
                                color: AppColors.textDark,
                                height: 1,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'H: ${weather.high.round()}°',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.secondryColor,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  'L: ${weather.low.round()}°',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.secondryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
