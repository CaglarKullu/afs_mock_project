import 'package:afs_mock_project/features/jobs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobForm extends ConsumerStatefulWidget {
  const JobForm({super.key});

  @override
  ConsumerState<JobForm> createState() => _JobFormState();
}

class _JobFormState extends ConsumerState<JobForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  JobStatus _selectedStatus = JobStatus.pending;

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final title = _titleController.text.trim();
      final selected = ref.read(selectedJobProvider);
      final notifier = ref.read(jobNotifierProvider.notifier);

      if (selected != null) {
        notifier.updateJob(
          selected.copyWith(title: title, status: _selectedStatus),
        );
      } else {
        notifier.addJob(title, _selectedStatus);
      }

      _resetForm();
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _titleController.clear();
    _selectedStatus = JobStatus.pending;
    ref.read(selectedJobProvider.notifier).state = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = ref.watch(selectedJobProvider) != null;

    if (isEditing) {
      _titleController.text = ref.watch(selectedJobProvider)!.title;
      _selectedStatus = ref.watch(selectedJobProvider)!.status;
    }

    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Job Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Title required'
                    : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<JobStatus>(
                value: _selectedStatus,
                items: JobStatus.values
                    .map(
                      (status) => DropdownMenuItem(
                        value: status,
                        child: Text(status.label),
                      ),
                    )
                    .toList(),
                onChanged: (status) {
                  if (status != null) setState(() => _selectedStatus = status);
                },
                decoration: const InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _submit,
                    icon: Icon(isEditing ? Icons.save : Icons.add),
                    label: Text(isEditing ? 'Update Job' : 'Add Job'),
                  ),
                  const SizedBox(width: 8),
                  if (isEditing)
                    TextButton(
                      onPressed: _resetForm,
                      child: const Text('Cancel'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
