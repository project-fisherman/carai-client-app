import 'package:carai/design_system/foundations/app_colors.dart';
import 'package:flutter/material.dart';

class ServiceQueueCard extends StatelessWidget {
  final String year;
  final String make;
  final String model;
  final String ownerName;
  final String licensePlate;
  final bool
  isOpacityReduced; // For the visual effect of last item in prompt? Or status?
  // Design shows the last card with opacity 0.75

  const ServiceQueueCard({
    super.key,
    required this.year,
    required this.make,
    required this.model,
    required this.ownerName,
    required this.licensePlate,
    this.isOpacityReduced = false,
  });

  @override
  Widget build(BuildContext context) {
    // Design colors:
    // border: stone-200 / dark: stone-800
    // bg: white / dark: surface-dark (0xFF2f221a)
    // shadow: dark: shadow-[0_4px_20px_-4px_rgba(0,0,0,0.5)]

    return Opacity(
      opacity: isOpacityReduced ? 0.75 : 1.0,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2f221a), // surface-dark
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF292524),
          ), // border-stone-800
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 20,
              offset: const Offset(0, 4),
              spreadRadius: -4,
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row: Car Info & Plate
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$year $make $model',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w800, // extrabold
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Owner: $ownerName',
                              style: const TextStyle(
                                color: Color(0xFFA8A29E), // text-stone-400
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Plate Box
                      Container(
                        constraints: const BoxConstraints(minWidth: 80),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C1917), // bg-stone-900
                          border: Border.all(
                            color: const Color(0xFF44403C),
                          ), // border-stone-700
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'PLATE',
                              style: TextStyle(
                                color: Color(0xFFA8A29E), // text-stone-400
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                height: 1.0,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              licensePlate,
                              style: const TextStyle(
                                color: Color(0xFFE7E5E4), // text-stone-200
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'monospace', // font-mono
                                letterSpacing: 1.0, // tracking-wider
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Buttons Row
                  Row(
                    children: [
                      // Edit Button
                      Expanded(
                        child: SizedBox(
                          height: 56, // h-14
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(
                                0xFF44403C,
                              ), // bg-stone-700
                              foregroundColor: const Color(
                                0xFFE7E5E4,
                              ), // text-stone-200
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.edit, size: 24),
                                SizedBox(width: 8),
                                Text(
                                  'EDIT',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // View Button
                      Expanded(
                        child: SizedBox(
                          height: 56, // h-14
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 10, // shadow-lg
                              shadowColor: Colors.orange.withValues(
                                alpha: 0.2,
                              ), // shadow-orange-900/20
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.visibility, size: 24),
                                SizedBox(width: 8),
                                Text(
                                  'VIEW',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
