# Local model files (not committed)

NeuroScope 3D's repository intentionally excludes large model checkpoint files and MRI volumes.
This package includes model provenance documentation, but not the root `models/**/*.pth` weights
or generated sample NIfTI masks. To run inference, restore the trained checkpoint from your
authorized local copy according to `docs/MODEL_CARD.md` and `SETUP_FROM_ZIP.md`.

The integrated Tracker module's `model.pt` remains in the repository because the bundled
module's setup instructions and license document describe it as part of that module.
