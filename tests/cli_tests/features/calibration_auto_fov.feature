# Testing calibration

@slow
@calibration
Feature: calibration auto FOV

    Scenario Outline: calibration auto FOV
      Given I use calibration_<ptv>.json for calibration
      When  I launch videostitch-cmd for calibration with calibration/scenes/<ptv>/<ptv>.ptv and " -d 0 -v 2 "
      Then  I expect the command to succeed
      When  I analyze score of calibration/scenes/<ptv>/output_scoring.ptv
      Then  I expect the score to be more than 0.75
      When  I analyze uncovered_ratio of calibration/scenes/<ptv>/output_scoring.ptv
      Then  I expect the full coverage to be <full_coverage>
      And   The calibration cost of output "calibration/scenes/<ptv>/output_calibration.ptv" is consistent with "calibration_<ptv>_ref.ptv"

        Examples:
           | ptv                    | full_coverage |
           | louvre_iter_fov        | true |
           | children_park_iter_fov | false |
