import os
import shutil


def rename_sql_files(source_folder, target_folder):
    counter = 1

    for filename in os.listdir(source_folder):
        if filename.endswith('.up.sql'):
            counter_str = str(counter).zfill(3)
            new_filename = filename.replace(filename[:3], counter_str)

            source_up_filepath = os.path.join(source_folder, filename)
            source_down_filename = filename.replace('.up.sql', '.down.sql')
            source_down_filepath = os.path.join(source_folder, source_down_filename)

            target_up_filepath = os.path.join(target_folder, new_filename)
            target_down_filepath = os.path.join(target_folder, source_down_filename)

            shutil.copy2(source_up_filepath, target_up_filepath)

            if os.path.exists(source_down_filepath):
                shutil.copy2(source_down_filepath, target_down_filepath)

            counter += 1


def main():
    source_folder = 'before'
    target_folder = 'after'

    if not os.path.exists(target_folder):
        os.makedirs(target_folder)

    rename_sql_files(source_folder, target_folder)


if __name__ == '__main__':
    main()

